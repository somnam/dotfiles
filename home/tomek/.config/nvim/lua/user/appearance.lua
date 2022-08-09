vim.g.dracula_colorterm = 0
-- Customize colors.
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="dracula",
  callback = function()
    vim.highlight.create('DraculaComment', {ctermfg=68, guibg="#6272A4"}, false)
  end
})
vim.cmd("silent! colorscheme dracula")
