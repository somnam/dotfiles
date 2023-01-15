local M = {}

M.listed = function(buffer)
  return vim.fn.buflisted(buffer) == 1
end

M.above_max_size = function(buffer, max_size)
  local buffer_size = vim.api.nvim_buf_get_offset(buffer, vim.api.nvim_buf_line_count(buffer))
  return buffer_size > max_size
end

M.blocked = function(buffer, option, blocklist)
  local bufoption = vim.api.nvim_buf_get_option(buffer, option)
  return vim.tbl_contains(blocklist, bufoption)
end

return M


