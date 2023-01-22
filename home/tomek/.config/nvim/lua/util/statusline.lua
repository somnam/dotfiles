local M = {}

M.get_columns = function()
  local global_status = vim.opt.laststatus:get() == 3
  return global_status and vim.go.columns or vim.fn.winwidth(0)
end

M.maybe_truncate = function(status, available_length)
  if #status > available_length then
    return status:sub(1, available_length) .. ">"
  end
  return status
end

M.available_branch_length = function(columns)
  local min_length = 9
  local factor = columns > 240 and 1 or columns > 120 and 2 or columns > 80 and 3 or 5
  local available_length = math.floor(columns / factor)
  return available_length > min_length and available_length or min_length
end

M.truncate_branch = function(branch)
  if #branch > 0 then
    return M.maybe_truncate(branch, M.available_branch_length(M.get_columns()))
  end
  return branch
end

return M
