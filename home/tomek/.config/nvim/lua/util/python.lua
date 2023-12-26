local command = require("util.command")

local M = {}

M.in_virtual_env = function ()
  return vim.env.VIRTUAL_ENV ~= nil
end

M.virtual_env_cmd = function(cmd)
  local virtual_env = vim.env.VIRTUAL_ENV
  return virtual_env and virtual_env .. "/bin/" .. cmd or nil
end

M.executable_in_virtual_env = function(cmd)
  return command.executable(M.virtual_env_cmd(cmd))
end

M.nvim_virtual_env = function ()
  local pyenv_root = vim.env.PYENV_ROOT
  return pyenv_root and pyenv_root .. "/versions/nvim" or nil
end

M.python_host_prog = function ()
  local nvim_virtual_env = M.nvim_virtual_env()
  local python_host_prog = nvim_virtual_env and nvim_virtual_env .. "/bin/python" or nil
  return command.executable(python_host_prog) and python_host_prog or nil
end

return M
