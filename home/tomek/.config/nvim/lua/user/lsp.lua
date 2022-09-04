local handlers_style = {focusable = true, style = "minimal", border = "rounded"}

handlers = {
  ["textDocument/hover"] = vim.lsp.handlers.hover,
  ["textDocument/signatureHelp"] = vim.lsp.handlers.signature_help,
}

for name, handler in pairs(handlers) do
  vim.lsp.handlers[name] = vim.lsp.with(handler, handlers_style)
end
