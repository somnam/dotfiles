local M = {}

M.nvim_version = function()
  local version = vim.version()

  return string.format(
    "NVIM v%d.%d.%d",
    version.major, version.minor, version.patch
  )
end

M.blank = ""

M.header = function()
  return {M.blank, M.nvim_version(), M.blank}
end

return M
