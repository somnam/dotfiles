local available, _ = pcall(require, "lspconfig")
if not available then return end

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>d[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>d]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dm', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lo', vim.lsp.buf.document_symbol, bufopts)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
end

local python_lsp_cmd = vim.fn.stdpath("data") .. "/python/bin/jedi-language-server"
if vim.fn.executable(python_lsp_cmd) == 1 then
  -- Enable diagnostics only when linter not available.
  local python_flake_cmd = vim.fn.stdpath("data") .. "/python/bin/flake8"
  local has_linter = vim.fn.executable(python_flake_cmd)

  require('lspconfig').jedi_language_server.setup({
      init_options = {
        diagnostics = {
          enable = has_linter ~= 1,
        },
      },
      on_attach = on_attach,
      cmd = { python_lsp_cmd },
  })
end
