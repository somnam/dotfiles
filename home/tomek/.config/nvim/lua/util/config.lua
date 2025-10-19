local M = {}

---@type table
M.config = require("util.file").read_json_file(vim.fn.stdpath("config") .. "/.config.json")

---@param location string
---@param default any?
---@return any
M.get = function(location, default)
  local option = vim.tbl_get(M.config, unpack(vim.split(location, "%.")))
  if option ~= nil then
    return option
  end
  return default
end

M.setup = function()
  vim.cmd(string.format([[set background=%s]], M.get("background", "dark")))
  vim.cmd(string.format([[silent! colorscheme %s]], M.get("colorscheme", "default")))
end

return M
