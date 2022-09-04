local available, lspconfig = pcall(require, "lspconfig")
if not available then return end

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end

  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set('n', '<Space>lD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<Space>ld', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<Space>lR', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Space>lr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Space>ls', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Space>lh', vim.lsp.buf.hover, bufopts)
end

local vim_data_path = vim.fn.stdpath("data")

local flake8_cmd = vim_data_path .. "/python/bin/flake8"

local python_lsp_cmd = vim_data_path .. "/python/bin/jedi-language-server"
if vim.fn.executable(python_lsp_cmd) == 1 then
  local function jedi_language_server_on_attach(client, bufnr)
    on_attach(client, bufnr)

    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters = {"."}
  end

  local function jedi_language_server_on_new_config(new_config, root_dir)
    -- Enable diagnostics only when linter is not available.
    local enable_diagnostics = vim.fn.executable(flake8_cmd) ~= 1

    -- Set additional paths for completion.
    local extra_paths = {
      root_dir .. "/.venv/lib/python3.7/site-packages",
      root_dir .. "/.venv/lib/python3.8/site-packages",
      root_dir .. "/.venv/lib/python3.9/site-packages",
      root_dir .. "/.venv/lib/python3.10/site-packages",
    }

    new_config.init_options = {
      diagnostics = {
        enable = enable_diagnostics,
      },
      workspace = {
        extraPaths = extra_paths,
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
