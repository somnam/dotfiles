local command = require("util.command")
local misc = require("util.misc")

local M = {}

M.virtual_env = vim.env.VIRTUAL_ENV

M.virtual_env_bin = M.virtual_env and M.virtual_env .. "/bin" or nil

M.in_virtual_env = function()
  return M.virtual_env ~= nil
end

M.virtual_env_cmd = function(cmd)
  return M.virtual_env_bin and M.virtual_env_bin .. "/" .. cmd or nil
end

M.executable_in_virtual_env = function(cmd)
  return command.executable(M.virtual_env_cmd(cmd))
end

M.pyenv_root = vim.env.PYENV_ROOT

M.pyenv_shims = M.pyenv_root and M.pyenv_root .. "/shims" or nil

M.nvim_virtual_env_prog = M.pyenv_root and M.pyenv_root .. "/versions/nvim/bin/python" or nil

M.set_nvim_virtual_env_prog = function()
  vim.g.python3_host_prog = (
    command.executable(M.nvim_virtual_env_prog) and M.nvim_virtual_env_prog or nil
  )
end

M.remove_pyenv_shims_from_path = function()
  -- Shims can lead to commands not working in cwd context.
  if M.pyenv_shims then
    local result, _ = string.gsub(vim.env.PATH, M.pyenv_shims .. misc.path_separator, "")
    vim.env.PATH = result
  end
end

M.add_virtual_env_bin_to_path = function()
  if M.virtual_env_bin then
    vim.env.PATH = M.virtual_env_bin .. misc.path_separator .. vim.env.PATH
  end
end

return M
