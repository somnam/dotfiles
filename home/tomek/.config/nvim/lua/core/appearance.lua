vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("autoresize_widows", { clear = true }),
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("ColorSchemePre", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("before_colorscheme", { clear = true }),
  command = "hi clear | syntax reset",
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("after_colorscheme", { clear = true }),
  command = [[
    hi! link SignColumn Normal
    hi! link WinBar StatusLine
    hi! link WinBarNC StatusLineNC
  ]],
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "habamax",
  group = vim.api.nvim_create_augroup("habamax_colorscheme", { clear = true }),
  command = [[
    hi! NonText ctermbg=none
    hi! VertSplit ctermbg=none
  ]],
})
