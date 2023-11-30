local M = {}

M.has_clients = function()
  return M.get_clients_count() > 0
end

M.get_clients_count = function()
  local bufnr = vim.api.nvim_get_current_buf()
  return table.getn(vim.lsp.get_active_clients({bufnr = bufnr}))
end

M.show_info = function()
  vim.cmd(":LspInfo")
end

M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end
end

return M
