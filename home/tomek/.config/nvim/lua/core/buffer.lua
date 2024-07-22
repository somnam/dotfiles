local M = {}

M.listed = function(buffer)
  return vim.fn.buflisted(buffer) == 1
end

M.above_max_size = function(buffer, max_size)
  local buffer_size = vim.api.nvim_buf_get_offset(buffer, vim.api.nvim_buf_line_count(buffer))
  return buffer_size > max_size
end

M.exclude = {
  buftype = {
    "nofile",
    "prompt",
    "quickfix",
    "terminal",
  },
  filetype = {
    "alpha",
    "checkhealth",
    "help",
    "lazy",
    "man",
    "mason",
    "netrw",
    "oil",
    "qf",
    "tutor",
  },
}

M.buftype_excluded = function(buffer, exclude_list)
  return vim.tbl_contains(exclude_list, vim.api.nvim_buf_get_option(buffer, "buftype"))
end

M.filetype_excluded = function(buffer, exclude_list)
  return vim.tbl_contains(exclude_list, vim.api.nvim_buf_get_option(buffer, "filetype"))
end

M.excluded = function(buffer, exclude_filetype, exclude_buftype)
  return (
    M.buftype_excluded(buffer, (exclude_buftype or M.exclude.buftype))
    or M.filetype_excluded(buffer, (exclude_filetype or M.exclude.filetype))
  )
end

return M
