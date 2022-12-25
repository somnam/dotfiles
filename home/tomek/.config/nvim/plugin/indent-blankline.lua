local available, indent_blankline = pcall(require, "indent_blankline")
if not available then return end

indent_blankline.setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
  -- A list of filetypes for which the auto command gets disabled
  filetype_exclude = {"netrw", "tutor"},
  -- A list of buffer types for which the auto command gets disabled
  buftype_exclude = {"help", "nofile", "terminal", "prompt", "alpha"},
})
