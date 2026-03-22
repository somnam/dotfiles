-- Core config
vim.cmd("runtime! core/**/*.lua")

-- Final setup
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("final_setup", { clear = true }),
  callback = require("util.config").setup,
})
