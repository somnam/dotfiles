local available, indent_blankline = pcall(require, "indent_blankline")
if not available then return end

indent_blankline.setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
})
