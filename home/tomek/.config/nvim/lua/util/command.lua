local M = {}

M.into_shell = function(cmd, args)
  local cmd_and_args = vim.list_extend({cmd}, args or {})
  return table.concat(cmd_and_args, " ")
end

M.executable = function(cmd)
  return vim.fn.executable(cmd) == 1
end

M.executable_at = function(path)
  if not vim.fn.filereadable(path) then
    return false
  end

  return string.sub(vim.fn.getfperm(path), 3, 3) == 'x'
end

M.executable_in_virtual_env = function(cmd)
  local virtual_env = vim.env.VIRTUAL_ENV
  local virtual_env_cmd = virtual_env and virtual_env .. '/bin/' .. cmd or nil
  return M.executable_at(virtual_env_cmd)
end

return M
