local M = {}

M.into_shell = function(cmd, args)
  local cmd_and_args = vim.list_extend({ cmd }, args or {})
  return table.concat(cmd_and_args, " ")
end

M.executable = function(cmd)
  return cmd and vim.fn.executable(cmd) == 1 or false
end

return M
