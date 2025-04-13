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
            logLevel = "Error",
          },
          pythonPath = python.virtual_env_cmd("python"),
        },
      },
      on_attach = function(client, bufnr)
        -- Customize trigger characters.
        client.server_capabilities.completionProvider.triggerCharacters = { "." }
      end,
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
      on_attach = function(client, bufnr)
        -- Customize trigger characters.
        client.server_capabilities.completionProvider.triggerCharacters =
          { ".", ":", ",", "#", "*", "@", "|", "?" }
      end,
    },
  }

  ---@param server string
  ---@return boolean
  H.lsp_server_available = function(server)
    local cmd = vim.lsp.config[server].cmd
    if type(cmd) == "table" then
      return command.executable(cmd[1])
    end
    return type(cmd) == "function"
  end

  for server, config in pairs(H.servers) do
    vim.lsp.config(server, config)
    if H.lsp_server_available(server) then
      vim.lsp.enable(server)
    end
  end
end)
