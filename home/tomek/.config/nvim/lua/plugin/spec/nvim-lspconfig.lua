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
    H.pylsp_settings = function()
      local plugins = {
        black = {enabled = false},
        autopep8 = {enabled = false},
        flake8 = {enabled = false},
        jedi_completion = {
          enabled = true,
          include_params = true,
          include_class_objects = true,
        },
        mccabe = {enabled = false},
        pycodestyle = {enabled = false},
        pyflakes = {enabled = false},
        pylint = {enabled = false},
        yapf = {enabled = false},
      }
      return {pylsp = {plugins = plugins}}
    end
    H.pylsp_flags = function()
      return {debounce_text_changes = 150}
    end
    H.pylsp_setup = function()
      if command.executable("pylsp") then
        lspconfig.pylsp.setup({
          capabilities = H.lsp_capabilities(),
          settings = H.pylsp_settings(),
          flags = H.pylsp_flags(),
          on_attach = lsp.on_attach,
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
          completion = {
            postfix = {enable = false},
          }
        }
      }
    end
    H.rust_analyzer_setup = function()
      if command.executable("rust-analyzer") then
        lspconfig.rust_analyzer.setup({
          capabilities = H.lsp_capabilities(),
          settings = H.rust_analyzer_settings(),
          on_attach = lsp.on_attach,
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
    H.pylsp_setup()
    H.rust_analyzer_setup()
    H.quick_lint_js_setup()
  end
}
