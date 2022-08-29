vim.g.dracula_colorterm = 0
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="dracula",
  callback = function()
    vim.highlight.create('DraculaComment', {ctermfg=68, guibg="#6272A4"}, false)
  end
})

vim.g.codedark_italics = 1
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="codedark",
  callback = function()
    vim.highlight.create('GitSignsAdd', {ctermbg=none, ctermfg=65, guibg=none, guifg="#4B5632"}, false)
    vim.highlight.create('GitSignsChange', {ctermbg=none, ctermfg=75, guibg=none, guifg="#005f87"}, false)
    vim.highlight.create('GitSignsDelete', {ctermbg=none, ctermfg=167, guibg=none, guifg="#6F1313"}, false)
  end
})

vim.cmd("silent! colorscheme codedark")
