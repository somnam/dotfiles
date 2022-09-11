local available, lualine = pcall(require, "lualine")
if not available then return end

local function columns()
  local global_status = vim.opt.laststatus:get() == 3
  return global_status and vim.go.columns or vim.fn.winwidth(0)
end

local function maybe_truncate(status, available_length)
  if #status > available_length then
    return status:sub(1, available_length) .. '>'
  end
  return status
end

local function available_branch_length(columns)
  local min_length = 9
  local factor = columns > 240 and 1 or columns > 120 and 2 or columns > 80 and 3 or 5
  local available_length = math.floor(columns / factor)
  return available_length > min_length and available_length or min_length
end

local function truncate_branch(branch)
  if #branch > 0 then
    return maybe_truncate(branch, available_branch_length(columns()))
  end
  return branch
end

local lualine_b = {
  {'branch', icons_enabled = true, fmt = truncate_branch},
  'diff',
  'diagnostics'
}

local lualine_c = {
  {'filename', file_status = true, path = 1},
}

lualine.setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_b = lualine_b,
    lualine_c = lualine_c,
  },
  inactive_sections = {
    lualine_c = lualine_c,
  },
})
