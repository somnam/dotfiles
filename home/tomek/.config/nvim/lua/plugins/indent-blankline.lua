local available, indent_blankline = pcall(require, "indent_blankline")
if not available then return end

indent_blankline.setup({
  use_treesitter = true,
  show_current_context = true,
})
