local misc = require("util.misc")

local M = {}

M.pyenv_root = vim.env.PYENV_ROOT

M.virtual_env = vim.env.VIRTUAL_ENV

M.virtual_env_bin = M.virtual_env and M.virtual_env .. "/bin" or nil

---@return boolean
M.in_virtual_env = function()
  return M.virtual_env ~= nil
end

---@param cmd string
---@return string?
M.virtual_env_cmd = function(cmd)
  return M.virtual_env_bin and M.virtual_env_bin .. "/" .. cmd or nil
end

---@param cmd string
---@return boolean
M.executable_in_virtual_env = function(cmd)
  local virtual_env_cmd = M.virtual_env_cmd(cmd)
  return virtual_env_cmd and misc.executable(virtual_env_cmd) or false
end

M.remove_pyenv_shims_from_path = function()
  -- Shims can populate PATH with commands not available in virtual env.
  if M.pyenv_root then
    local pyenv_shims_path = M.pyenv_root .. "/shims" .. misc.path_separator
    local result, _ = string.gsub(vim.env.PATH, pyenv_shims_path, "")
    vim.env.PATH = result
  end
end

M.add_virtual_env_bin_to_path = function()
  -- Add current virtual env to path.
  if M.virtual_env_bin then
    vim.env.PATH = M.virtual_env_bin .. misc.path_separator .. vim.env.PATH
  end
end

return M
