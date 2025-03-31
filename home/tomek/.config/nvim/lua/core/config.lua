local M = {}

---@type table
M.config = require("util.file").read_json_file(vim.fn.stdpath("config") .. "/.config.json")

---@param location string
---@param default any?
---@return any
M.get = function(location, default)
  return vim.tbl_get(M.config, unpack(vim.split(location, "%."))) or default
end

return M
