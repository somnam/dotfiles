local command = require("util.command")
local python = require("util.python")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({ source = "neovim/nvim-lspconfig" })

  local H = {}

  H.servers = {
    jedi_language_server = {
      init_options = {
        completion = {
          disableSnippets = true,
        },
        workspace = {
          environmentPath = python.virtual_env,
        },
      },
      on_attach = function(client, _)
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
            logLevel = "Error",
          },
          pythonPath = python.virtual_env_cmd("python"),
        },
      },
    },
    quick_lint_js = {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
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
      on_attach = function(client, _)
        client.server_capabilities.completionProvider.triggerCharacters =
          { ".", ":", "(", "[", ",", "#", "*", "@", "|", "=", "{", "+", "?" }
      end,
    },
  }

  H.get_capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local additional_capabilities = {}

    if pcall(require, "cmp_nvim_lsp") then
      additional_capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    return vim.tbl_deep_extend("force", capabilities, additional_capabilities)
  end

  ---@param name string
  ---@return boolean
  H.lsp_server_available = function(name)
    local cmd = require("lspconfig")[name].document_config.default_config.cmd
    return type(cmd) == "table" and command.executable(cmd[1])
  end

  local lspconfig = require("lspconfig")
  local capabilities = H.get_capabilities()
  for name, config in pairs(H.servers) do
    if H.lsp_server_available(name) then
      config = vim.tbl_deep_extend("force", { capabilities = capabilities }, config)
      lspconfig[name].setup(config)
    end
  end

  require("lspconfig.ui.windows").default_options.border = "rounded"
end)
