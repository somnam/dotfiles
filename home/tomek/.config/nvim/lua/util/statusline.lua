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
  local factor = columns > 240 and 1 or columns > 120 and 2 or columns > 80 and 6 or 10
  local available_length = math.floor(columns / factor)
  return available_length > min_length and available_length or min_length
end

M.truncate_branch = function(branch)
  if #branch > 0 then
    return M.maybe_truncate(branch, M.available_branch_length(M.get_columns()))
  end
  return branch
end

M.copy_file_path_to_clipboard = function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  vim.defer_fn(function() vim.cmd("echon ''") end, 600)
  vim.api.nvim_notify("Path copied to clipboard.", vim.log.levels.INFO, {})
end

M.location = function()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")

  return string.format('%3d:%-2d', line, col)
end

return M
