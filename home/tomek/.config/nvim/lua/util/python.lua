local command = require("util.command")

local M = {}

M.virtual_env_cmd = function(cmd)
  local virtual_env = vim.env.VIRTUAL_ENV
  return virtual_env and virtual_env .. '/bin/' .. cmd or nil
end

M.executable_in_virtual_env = function(cmd)
  return command.executable_at(M.virtual_env_cmd(cmd))
end

return M
