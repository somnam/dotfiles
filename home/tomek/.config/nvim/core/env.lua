local file = require("util.file")

local function add_virtual_env_bin_to_path()
  local virtual_env = vim.env.VIRTUAL_ENV
  local virtual_env_bin = virtual_env and virtual_env .. "/bin" or nil
  -- Add current virtual env to path.
  if virtual_env_bin then
    vim.env.PATH = virtual_env_bin .. file.path_separator .. vim.env.PATH
  end
end

add_virtual_env_bin_to_path()
