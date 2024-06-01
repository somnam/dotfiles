local M = {}

M.location = function()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")

  return string.format("%3d:%-2d", line, col)
end

return M
