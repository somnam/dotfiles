local available, lspconfig = pcall(require, "lspconfig")
if not available then return end

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end

  local bufopts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>ld", ":lua vim.lsp.buf.definition()<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>lr", ":lua vim.lsp.buf.rename()<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>lf", ":lua vim.lsp.buf.references()<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>ls", ":lua vim.lsp.buf.signature_help()<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>lh", ":lua vim.lsp.buf.hover()<Enter>", bufopts)
end

local vim_data_path = vim.fn.stdpath("data")

local python_lsp_cmd = vim_data_path .. "/python/bin/jedi-language-server"
if vim.fn.executable(python_lsp_cmd) == 1 then
  local flake8_cmds = {"flake8", vim_data_path .. "/python/bin/flake8"}

  local function jedi_language_server_on_attach(client, bufnr)
    on_attach(client, bufnr)

    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters = {"."}
  end

  local function jedi_language_server_on_new_config(new_config, root_dir)
    -- Enable diagnostics only when linter is not available.
    local enable_diagnostics = true
    for _, flake8_cmd in ipairs(flake8_cmds) do
      if vim.fn.executable(flake8_cmd) == 1 then
        enable_diagnostics = false
        break
      end
    end

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
