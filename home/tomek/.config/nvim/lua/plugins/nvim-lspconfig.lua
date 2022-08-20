local available, lspconfig = pcall(require, "lspconfig")
if not available then return end

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<Space>d[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<Space>d]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Space>dm', vim.diagnostic.setloclist, opts)

local function on_attach(client, bufnr)
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set('n', '<Space>lD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<Space>ld', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<Space>lR', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Space>lr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Space>ls', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Space>lh', vim.lsp.buf.hover, bufopts)
end

local python_lsp_cmd = vim.fn.stdpath("data") .. "/python/bin/jedi-language-server"
if vim.fn.executable(python_lsp_cmd) == 1 then
  local python_flake_cmd = vim.fn.stdpath("data") .. "/python/bin/flake8"

  -- Enable diagnostics only when linter is not available.
  local has_linter = vim.fn.executable(python_flake_cmd)

  local function jedi_language_server_on_attach(client, bufnr)
      on_attach(client, bufnr)

      -- Customize trigger characters.
      client.server_capabilities.completionProvider.triggerCharacters = {"."}
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local extra_paths = {
    -- Additional paths for completion.
    -- vim.fn.expand("~/additional/path"),
  }

  lspconfig.jedi_language_server.setup({
      init_options = {
        diagnostics = {
          enable = has_linter ~= 1,
        },
        workspace = {
          extraPaths = extra_paths,
        },
      },
      capabilities = capabilities,
      on_attach = jedi_language_server_on_attach,
      cmd = { python_lsp_cmd },
  })
end
