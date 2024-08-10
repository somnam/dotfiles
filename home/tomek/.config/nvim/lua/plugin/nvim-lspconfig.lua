local command = require("util.command")
local misc = require("util.misc")
local python = require("util.python")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "williamboman/mason.nvim" },
  opts = function(_, opts)
    return misc.deep_extend({
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      servers = {
        jedi_language_server = {
          init_options = {
            completion = {
              disableSnippets = true,
            },
          },
          on_attach = function(client, bufnr)
            -- Customize trigger characters.
            client.server_capabilities.completionProvider.triggerCharacters = { "." }
          end,
        },
        pyright = {
          settings = {
            pyright = {
              disableLanguageServices = false,
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
              },
              pythonPath = python.virtual_env_cmd("python"),
            },
          },
        },
        quick_lint_js = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
              completion = {
                postfix = { enable = false },
              },
            },
          },
        },
        lua_ls = {
          on_attach = function(client, bufnr)
            client.server_capabilities.completionProvider.triggerCharacters =
              { ".", ":", "(", "[", ",", "#", "*", "@", "|", "=", "{", "+", "?" }
          end,
        },
      },
    }, opts)
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local lspconfig_configs = require("lspconfig.configs")

    lspconfig_configs.quick_lint_js = {
      default_config = {
        cmd = { "quick-lint-js", "--lsp" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_dir = function(filename)
          local root = lspconfig.util.path.dirname(filename)
          lspconfig.util.path.traverse_parents(filename, function(dir, _)
            root = dir
          end)
          return root
        end,
      },
      docs = { description = "quick-lint-js" },
    }

    for server, server_config in pairs(opts.servers) do
      local cmd = lspconfig[server].document_config.default_config.cmd
      if type(cmd) == "table" and command.executable(cmd[1]) then
        lspconfig[server].setup(
          vim.tbl_deep_extend("force", { capabilities = opts.capabilities }, server_config)
        )
      end
    end

    require("lspconfig.ui.windows").default_options.border = "rounded"
  end,
}
