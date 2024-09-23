local command = require("util.command")
local python = require("util.python")

local servers = {
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

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    }, opts)
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")

    for server, server_config in pairs(servers) do
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
