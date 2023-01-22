local M = {}

M.nvim_version = function()
  local version = vim.version()

  return string.format(
    "Nvim v%d.%d.%d %s",
    version.major, version.minor, version.patch,
    jit.version
  )
end

M.header_padding = function(pad)
  pad = pad ~= nil and pad or 4
  local repeats = string.len(M.nvim_version()) + pad
  return string.rep("=", repeats)
end

M.header = function()
  return {
    string.format(" %s ", M.header_padding()),
    string.format(" = %s = ", M.nvim_version()),
    string.format(" %s ", M.header_padding()),
  }
end

return M
