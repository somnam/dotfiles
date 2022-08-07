local available, lualine = pcall(require, "lualine")
if not available then return end

lualine.setup({
  options = {
    icons_enabled = false,
    theme = 'dracula',
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_a = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    }
  }
})
