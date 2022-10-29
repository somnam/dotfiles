vim.g.dracula_colorterm = 0
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="dracula",
  callback = function()
    vim.api.nvim_set_hl(0, "DraculaComment", {ctermfg=68, bg="#6272A4"})
    vim.api.nvim_set_hl(0, "CursorLine", {ctermbg=235, bg="#424450"})
  end
})

vim.g.codedark_italics = 1
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="codedark",
  callback = function()
    vim.api.nvim_set_hl(0, "GitSignsAdd", {ctermbg=none, ctermfg=65, bg=none, fg="#4B5632"})
    vim.api.nvim_set_hl(0, "GitSignsChange", {ctermbg=none, ctermfg=75, bg=none, fg="#005f87"})
    vim.api.nvim_set_hl(0, "GitSignsDelete", {ctermbg=none, ctermfg=167, bg=none, fg="#6F1313"})
  end
})

vim.cmd("silent! colorscheme codedark")
