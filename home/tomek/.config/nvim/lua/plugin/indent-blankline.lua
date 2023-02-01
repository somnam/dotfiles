local P = {"lukas-reineke/indent-blankline.nvim"}

P.config = function()
  local indent_blankline = require("indent_blankline")

  -- setup
  indent_blankline.setup({
    show_current_context = true,
    show_trailing_blankline_indent = false,
    -- A list of filetypes for which the auto command gets disabled
    filetype_exclude = {"alpha", "help", "packer", "netrw", "NvimTree", "tutor"},
    -- A list of buffer types for which the auto command gets disabled
    buftype_exclude = {"nofile", "prompt", "terminal"},
  })
end

return P
