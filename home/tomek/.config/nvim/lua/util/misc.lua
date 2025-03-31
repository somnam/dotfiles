local M = {}

---@return string
M.nvim_version = function()
  local version = vim.version()

  return string.format("v%d.%d.%d", version.major, version.minor, version.patch)
end

---@type string
M.path_separator = vim.fn.has("win32") == 1 and ";" or ":"

return M
