local command = require("util.command")
local python = require("util.python")

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

H.capabilities = vim.lsp.protocol.make_client_capabilities()

---@param name string
---@return boolean
H.lsp_server_available = function(name)
  local cmd = require("lspconfig")[name].document_config.default_config.cmd
  return type(cmd) == "table" and command.executable(cmd[1])
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local capabilities = vim.tbl_deep_extend("force", H.capabilities, opts.capabilities or {})

    for name, config in pairs(H.servers) do
      if H.lsp_server_available(name) then
        config = vim.tbl_deep_extend("force", { capabilities = capabilities }, config)
        lspconfig[name].setup(config)
      end
    end

    require("lspconfig.ui.windows").default_options.border = "rounded"
  end,
}
