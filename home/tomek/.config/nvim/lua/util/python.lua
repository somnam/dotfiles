local command = require("util.command")

local M = {}

M.executable_in_virtual_env = function(cmd)
  local virtual_env = vim.env.VIRTUAL_ENV
  local virtual_env_cmd = virtual_env and virtual_env .. '/bin/' .. cmd or nil
  return command.executable_at(virtual_env_cmd)
end

return M
