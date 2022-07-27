-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>m', vim.diagnostic.setloclist, opts)

-- Use an on_attach function after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>R', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>o', vim.lsp.buf.document_symbol, bufopts)
  vim.keymap.set('n', '<leader>s', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
end

local python_lsp_cmd = vim.fn.stdpath("data") .. "/python/bin/jedi-language-server"
if vim.fn.executable(python_lsp_cmd) == 1 then
  require('lspconfig').jedi_language_server.setup({
      on_attach = on_attach,
      cmd = { python_lsp_cmd },
  })
end
