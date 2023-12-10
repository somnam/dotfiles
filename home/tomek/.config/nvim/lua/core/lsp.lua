local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap(
  "n", "<Space>d", ":lua vim.lsp.buf.definition()<Enter>",
  vim.tbl_extend("keep", {desc = "Jump to symbol definition"}, opts)
)
vim.api.nvim_set_keymap(
  "n", "<Space>r", ":lua vim.lsp.buf.rename()<Enter>",
  vim.tbl_extend("keep", {desc = "Rename all symbol references"}, opts)
)
vim.api.nvim_set_keymap(
  "n", "<Space>h", ":lua vim.lsp.buf.hover()<Enter>",
  vim.tbl_extend("keep", {desc = "Display symbol hover information"}, opts)
)
vim.api.nvim_set_keymap(
  "n", "<Space>k", ":lua vim.lsp.buf.signature_help()<Enter>",
  vim.tbl_extend("keep", {desc = "Display symbol signature information"}, opts)
)
vim.api.nvim_set_keymap(
  "o", "<Space>o", ":lua vim.lsp.buf.document_symbol()<Enter>",
  vim.tbl_extend("keep", {desc = "List all current buffer symbols"}, opts)
)
vim.api.nvim_set_keymap(
  "n", "<Space>a", ":lua vim.lsp.buf.references()<Enter>",
  vim.tbl_extend("keep", {desc = "List all symbol references"}, opts)
)

local handlers = {
  ["textDocument/hover"] = vim.lsp.handlers.hover,
  ["textDocument/signatureHelp"] = vim.lsp.handlers.signature_help,
}

local handlers_style = {focusable = true, style = "minimal", border = "rounded"}

for name, handler in pairs(handlers) do
  vim.lsp.handlers[name] = vim.lsp.with(handler, handlers_style)
end

vim.lsp.set_log_level("ERROR")
