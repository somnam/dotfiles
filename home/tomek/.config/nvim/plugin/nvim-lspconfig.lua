local available, lspconfig = pcall(require, "lspconfig")
if not available then return end

local fzf_lua_available, _ = pcall(require, "fzf-lua")

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end

  local bufopts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>d", ":lua vim.lsp.buf.definition()<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>r", ":lua vim.lsp.buf.rename()<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>k", ":lua vim.lsp.buf.hover()<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>K", ":lua vim.lsp.buf.signature_help()<Enter>", bufopts)

  if fzf_lua_available then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>o", ":FzfLua lsp_document_symbols<Enter>", bufopts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>a", ":FzfLua lsp_references<Enter>", bufopts)
  else
    vim.api.nvim_buf_set_keymap(bufnr, "o", "<Space>o", ":lua vim.lsp.buf.document_symbol()<Enter>", bufopts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>a", ":lua vim.lsp.buf.references()<Enter>", bufopts)
  end
end

local python_lsp_cmd = "jedi-language-server"
if vim.fn.executable(python_lsp_cmd) == 1 then
  local function jedi_language_server_on_attach(client, bufnr)
    on_attach(client, bufnr)

    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters = {"."}
  end

  local function jedi_language_server_on_new_config(new_config, root_dir)
    -- Enable diagnostics only when linter is not available.
    local enable_diagnostics = vim.fn.executable("flake8") ~= 1

    new_config.init_options = {
      diagnostics = {
        enable = enable_diagnostics,
      },
    }
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  lspconfig.jedi_language_server.setup({
    capabilities = capabilities,
    on_attach = jedi_language_server_on_attach,
    on_new_config = jedi_language_server_on_new_config,
    cmd = { python_lsp_cmd },
  })
end

local rust_lsp_cmd = "rust-analyzer"
if vim.fn.executable(rust_lsp_cmd) == 1 then

  local rust_analyzer_settings = {
    checkOnSave = {
      command = "clippy",
    },
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = rust_analyzer_settings
    },
    cmd = { rust_lsp_cmd }
  })
end
