local P = {"lukas-reineke/indent-blankline.nvim"}

P.dependencies = {
  "nvim-treesitter/nvim-treesitter",
}

P.config = function()
  local indent_blankline = require("indent_blankline")
  local buffer = require("util.buffer")

  -- setup
  indent_blankline.setup({
    show_current_context = true,
    show_trailing_blankline_indent = false,
    -- A list of filetypes for which the auto command gets disabled
    filetype_exclude = buffer.exclude.filetype,
    -- A list of buffer types for which the auto command gets disabled
    buftype_exclude = buffer.exclude.buftype,
  })
end

return P
