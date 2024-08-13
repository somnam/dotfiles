local M = {}

M.nvim_version = function()
  local version = vim.version()

  return string.format("NVIM v%d.%d.%d", version.major, version.minor, version.patch)
end

M.path_separator = vim.fn.has("win32") == 1 and ";" or ":"

return M
