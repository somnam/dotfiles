local available, guess_indent = pcall(require, "guess-indent")
if not available then return end

-- setup
guess_indent.setup({
  auto_cmd = true,
  -- A list of filetypes for which the auto command gets disabled
  filetype_exclude = {"netrw", "tutor"},
  -- A list of buffer types for which the auto command gets disabled
  buftype_exclude = {"help", "nofile", "terminal", "prompt", "alpha"},
})

