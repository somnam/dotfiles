local available, lualine = pcall(require, "lualine")
if not available then return end


local lualine_c = {
  {
    'filename',
    -- displays file status (readonly status, modified status)
    file_status = true,
    -- 0 = just filename, 1 = relative path, 2 = absolute path
    path = 1,
  }
}

lualine.setup({
  options = {
    icons_enabled = false,
    theme = 'dracula',
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_c = lualine_c,
  },
  inactive_sections = {
    lualine_c = lualine_c,
  },
})
