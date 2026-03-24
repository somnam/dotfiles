local file = require("util.file")

local M = {}

M.virtual_env = vim.env.VIRTUAL_ENV

M.virtual_env_bin = M.virtual_env and M.virtual_env .. "/bin" or nil

M.add_virtual_env_bin_to_path = function()
  -- Add current virtual env to path.
  if M.virtual_env_bin then
    vim.env.PATH = M.virtual_env_bin .. file.path_separator .. vim.env.PATH
  end
end

return M
