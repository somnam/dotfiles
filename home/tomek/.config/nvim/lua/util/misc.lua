local M = {}

---@return string
M.nvim_version = function()
  local version = vim.version()

  return string.format("v%d.%d.%d", version.major, version.minor, version.patch)
end

---@type string
M.path_separator = vim.fn.has("win32") == 1 and ";" or ":"

---@param keys string
---@param mode string
M.feedkeys = function(keys, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), mode, true)
end

---@param cmd string
M.executable = function(cmd)
  return vim.fn.executable(cmd) == 1
end

return M
