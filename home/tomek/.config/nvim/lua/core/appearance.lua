vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function() vim.hl.on_yank({ higroup = "IncSearch", timeout = 300 }) end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("auto_resize_widows", { clear = true }),
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("WinEnter", {
  group = vim.api.nvim_create_augroup("auto_show_cursorline", { clear = true }),
  callback = function()
    if vim.w.auto_show_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_show_cursorline = nil
    end
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = vim.api.nvim_create_augroup("auto_hide_cursorline", { clear = true }),
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_show_cursorline = true
      vim.wo.cursorline = false
    end
  end,
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
  pattern = "default",
  group = vim.api.nvim_create_augroup("after_default_colorscheme", { clear = true }),
  command = [[
    hi! StatusLine cterm=bold,reverse
    hi! StatusLineNC cterm=reverse
    hi! link MiniStatuslineModeInsert Search
  ]],
})
