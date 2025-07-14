local command = require("util.command")
local python = require("util.python")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
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
    vtsls = {
      settings = {
        complete_function_calls = true,
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            completion = {
              enableServerSideFuzzyMatch = true,
            },
          },
        },
        javascript = {
          updateImportsOnFileMove = { enabled = "always" },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = true },
          },
        },
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = { completeFunctionCalls = true },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
          },
        },
      },
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
      settings = {
        Lua = {
          completion = {
            showWord = "Disable",
          },
          diagnostics = {
            enable = true,
            -- Only diagnose opened files
            workspaceDelay = -1,
            workspaceEvent = "None",
          },
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          telemetry = { enable = false },
          workspace = {
            maxPreload = 1000,
            checkThirdParty = false,
          },
        },
      },
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
