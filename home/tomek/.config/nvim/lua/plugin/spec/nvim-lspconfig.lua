return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")
    local command = require("util.command")
    local lsp = require("util.lsp")

    local H = {}

    H.customize_ui = function()
      local windows = require('lspconfig.ui.windows')
      windows.default_options.border = 'single'
    end

    H.lsp_capabilities = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_nvim_lsp_available, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

      if cmp_nvim_lsp_available then
        capabilities = vim.tbl_deep_extend(
          "force",
          capabilities,
          cmp_nvim_lsp.default_capabilities()
        )
      end

      return capabilities
    end

    -- python
    H.jedi_language_server_on_attach = function(client, bufnr)
      -- Customize trigger characters.
      client.server_capabilities.completionProvider.triggerCharacters = {"."}

      lsp.on_attach(client, bufnr)
    end
    H.jedi_language_server_on_new_config = function(new_config, _)
      -- Enable diagnostics only when linter is not available.
      local enable_diagnostics = not command.executable("flake8")

      new_config.init_options = {
        diagnostics = {
          enable = enable_diagnostics,
        },
      }
    end
    H.jedi_language_server_setup = function()
      if command.executable("jedi-language-server") then
        lspconfig.jedi_language_server.setup({
          capabilities = H.lsp_capabilities(),
          on_attach = H.jedi_language_server_on_attach,
          on_new_config = H.jedi_language_server_on_new_config,
        })
      end
    end

    -- rust
    H.rust_analyzer_settings = function()
      return {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
          },
        }
      }
    end
    H.rust_analyzer_setup = function()
      if command.executable("rust-analyzer") then
        lspconfig.rust_analyzer.setup({
          capabilities = H.lsp_capabilities(),
          settings = H.rust_analyzer_settings(),
          on_attach = H.on_attach,
        })
      end
    end

    -- js
    H.quick_lint_js_setup = function()
      if command.executable("quick-lint-js") then
        local function root_dir(filename)
          local root = lspconfig.util.path.dirname(filename)
          lspconfig.util.path.traverse_parents(
            filename, function(dir, _) root = dir end
          )
          return root
        end

        configs.quick_lint_js = {
          default_config = {
            cmd = {"quick-lint-js", "--lsp"},
            filetypes = {"javascript", "javascriptreact"},
            root_dir = root_dir,
          },
          docs = {description = "quick-lint-js"}
        }

        lspconfig.quick_lint_js.setup({})
      end
    end

    -- setup
    H.customize_ui()
    H.jedi_language_server_setup()
    H.rust_analyzer_setup()
    H.quick_lint_js_setup()
  end
}
