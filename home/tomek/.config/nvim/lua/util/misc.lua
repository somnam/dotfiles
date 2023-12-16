local M = {}

M.nvim_version = function()
  local version = vim.version()

  return string.format(
    "NVIM v%d.%d.%d",
    version.major, version.minor, version.patch
  )
end

M.map_extend = function(dst, src)
  if not dst then return src end

  if vim.tbl_islist(dst) and vim.tbl_islist(src) then
    return vim.list_extend(dst, src)
  end

  for key, value in pairs(src) do
    if type(value) == "table" and type(src[key]) == "table" then
      dst[key] = M.map_extend(dst[key], value)
    else
      dst[key] = src[key] or dst[key]
    end
  end

  return dst
end

return M
