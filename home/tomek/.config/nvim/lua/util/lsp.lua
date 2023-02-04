local M = {}

M.has_clients = function()
  local bufnr = vim.api.nvim_get_current_buf()
  return table.getn(vim.lsp.get_active_clients({bufnr = bufnr})) > 0
end

M.get_clients_count = function()
  local bufnr = vim.api.nvim_get_current_buf()
  return table.getn(vim.lsp.get_active_clients({bufnr = bufnr}))
end

M.show_info = function()
  vim.cmd(":LspInfo")
end

return M
