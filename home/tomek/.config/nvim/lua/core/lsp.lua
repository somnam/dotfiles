local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
  "n",
  "<Space>r",
  ":lua vim.lsp.buf.rename()<Enter>",
  vim.tbl_extend("keep", { desc = "Rename all symbol references" }, opts)
)
vim.api.nvim_set_keymap(
  "o",
  "<Space>o",
  ":lua vim.lsp.buf.document_symbol()<Enter>",
  vim.tbl_extend("keep", { desc = "List all current buffer symbols" }, opts)
)
vim.api.nvim_set_keymap(
  "n",
  "<Space>a",
  ":lua vim.lsp.buf.references()<Enter>",
  vim.tbl_extend("keep", { desc = "List all symbol references" }, opts)
)

local handlers = {
  ["textDocument/hover"] = vim.lsp.handlers.hover,
  ["textDocument/signatureHelp"] = vim.lsp.handlers.signature_help,
}
local handlers_style = { focusable = true, style = "minimal", border = "rounded" }
for name, handler in pairs(handlers) do
  vim.lsp.handlers[name] = vim.lsp.with(handler, handlers_style)
end

vim.lsp.set_log_level("ERROR")
