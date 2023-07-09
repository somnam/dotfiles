local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>d", ":lua vim.lsp.buf.definition()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>r", ":lua vim.lsp.buf.rename()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>h", ":lua vim.lsp.buf.hover()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>k", ":lua vim.lsp.buf.signature_help()<Enter>", opts)
vim.api.nvim_set_keymap("o", "<Space>o", ":lua vim.lsp.buf.document_symbol()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>a", ":lua vim.lsp.buf.references()<Enter>", opts)

local handlers = {
  ["textDocument/hover"] = vim.lsp.handlers.hover,
  ["textDocument/signatureHelp"] = vim.lsp.handlers.signature_help,
}

local handlers_style = {focusable = true, style = "minimal", border = "rounded"}

for name, handler in pairs(handlers) do
  vim.lsp.handlers[name] = vim.lsp.with(handler, handlers_style)
end
