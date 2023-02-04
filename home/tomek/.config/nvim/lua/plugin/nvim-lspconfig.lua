local P = {"neovim/nvim-lspconfig"}

P.config = function()
  local lspconfig = require("lspconfig")

  local H = {}

  H.on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    if client.server_capabilities.definitionProvider then
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end
  end

  H.lsp_capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_nvim_lsp_available, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

    if cmp_nvim_lsp_available then
      capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        cmp_nvim_lsp.default_capabilities({snippetSupport = false})
      )
    end

    return capabilities
  end

  H.jedi_language_server_on_attach = function(client, bufnr)
    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters = {"."}

    H.on_attach(client, bufnr)
  end

  H.jedi_language_server_on_new_config = function(new_config, _)
    -- Enable diagnostics only when linter is not available.
    local enable_diagnostics = vim.fn.executable("flake8") ~= 1

    new_config.init_options = {
      diagnostics = {
        enable = enable_diagnostics,
      },
    }
  end

  H.rust_analyzer_settings = function()
    return {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      }
    }
  end

  -- setup

  if vim.fn.executable("jedi-language-server") == 1 then
    lspconfig.jedi_language_server.setup({
      capabilities = H.lsp_capabilities(),
      on_attach = H.jedi_language_server_on_attach,
      on_new_config = H.jedi_language_server_on_new_config,
    })
  end

  if vim.fn.executable("rust-analyzer") == 1 then
    lspconfig.rust_analyzer.setup({
      capabilities = H.lsp_capabilities(),
      settings = H.rust_analyzer_settings(),
      on_attach = H.on_attach,
    })
  end
end

return P
