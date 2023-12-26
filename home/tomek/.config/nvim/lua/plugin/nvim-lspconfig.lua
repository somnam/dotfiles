local python = require("util.python")
local lsp = require("util.lsp")
local command = require("util.command")
local misc = require("util.misc")

return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {"williamboman/mason.nvim"},
  init = function ()
    local lspconfig = require("lspconfig")

    require("lspconfig.configs").quick_lint_js = {
      default_config = {
        cmd = {"quick-lint-js", "--lsp"},
        filetypes = {"javascript", "javascriptreact"},
        root_dir = function (filename)
          local root = lspconfig.util.path.dirname(filename)
          lspconfig.util.path.traverse_parents(
            filename, function(dir, _) root = dir end
          )
          return root
        end,
      },
      docs = {description = "quick-lint-js"}
    }
  end,
  opts = function (_, opts)
    return misc.map_extend({
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
            client.server_capabilities.completionProvider.triggerCharacters = {"."}
            return lsp.on_attach(client, bufnr)
          end,
        },
        pyright = {
          settings = {
            pyright = {
              disableLanguageServices = false,
              disableOrganizeImports = true
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
            }
          },
          on_attach = lsp.on_attach,
        },
        quick_lint_js = {
          on_attach = lsp.on_attach,
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
              completion = {
                postfix = {enable = false},
              }
            }
          },
          on_attach = lsp.on_attach,
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = {version = 'LuaJIT'},
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                }
              }
            }
          },
          on_attach = lsp.on_attach,
        },
      },
    }, opts)
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")

    -- setup
    for server, server_config in pairs(opts.servers) do
      local cmd = lspconfig[server].document_config.default_config.cmd
      if type(cmd) == 'table' and command.executable(cmd[1]) then
        lspconfig[server].setup(vim.tbl_deep_extend(
          "force",
          {capabilities = opts.capabilities},
          server_config
        ))
      end
    end

    require('lspconfig.ui.windows').default_options.border = 'single'
  end
}
