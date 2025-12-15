local config = require("util.config")

local M = {}

---@type integer
M.max_size = 1024 * 1024

---@param bufnr integer
---@param max_size integer?
---@return boolean
M.above_max_size = function(bufnr, max_size)
  local buffer_size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
  return buffer_size > (max_size or M.max_size)
end

---@type string[]
M.exclude_filetype = config.get("buffer.exclude_filetype", {})

---@param bufnr integer
---@param exclude_filetype string[]?
---@return boolean
M.excluded = function(bufnr, exclude_filetype)
  return vim.tbl_contains((exclude_filetype or M.exclude_filetype), vim.bo[bufnr].filetype)
end

---@param bufnr integer
---@param exclude_filetype string[]?
---@param max_size integer?
---@return boolean
M.excluded_or_above_max_size = function(bufnr, exclude_filetype, max_size)
  return (M.excluded(bufnr, exclude_filetype) or M.above_max_size(bufnr, max_size))
end

return M
