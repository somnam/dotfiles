local available, lualine = pcall(require, "lualine")
if not available then return end

local statusline = require("utils.statusline")
local icon = require("utils.icon").lualine

-- helper
local H = {}

H.lualine_b = {
  {
    "branch",
    icons_enabled = true,
    fmt = statusline.truncate_branch,
  },
  "diff",
  "diagnostics"
}

H.lualine_c = {
  {"filename", file_status = true, path = 1},
}

H.lualine_x = {"encoding", "fileformat", "filetype"}

-- setup
lualine.setup({
  options = {
    icons_enabled = false,
    theme = "auto",
    section_separators = icon.section_separators,
    component_separators = "",
  },
  sections = {
    lualine_b = H.lualine_b,
    lualine_c = H.lualine_c,
    lualine_x = H.lualine_x,
  },
  inactive_sections = {
    lualine_c = H.lualine_c,
    lualine_x = H.lualine_x,
  },
})
