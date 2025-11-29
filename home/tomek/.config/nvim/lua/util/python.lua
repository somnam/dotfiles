local file = require("util.file")

local M = {}

M.pyenv_root = vim.env.PYENV_ROOT

M.virtual_env = vim.env.VIRTUAL_ENV

M.virtual_env_bin = M.virtual_env and M.virtual_env .. "/bin" or nil

M.remove_pyenv_shims_from_path = function()
  -- Shims can populate PATH with commands not available in virtual env.
  if M.pyenv_root then
    local pyenv_shims_path = M.pyenv_root .. "/shims" .. file.path_separator
    local result, _ = string.gsub(vim.env.PATH, pyenv_shims_path, "")
    vim.env.PATH = result
  end
end

M.add_virtual_env_bin_to_path = function()
  -- Add current virtual env to path.
  if M.virtual_env_bin then
    vim.env.PATH = M.virtual_env_bin .. file.path_separator .. vim.env.PATH
  end
end

return M
