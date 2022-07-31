local available, _ = pcall(require, "nvim-treesitter")
if not available then return end

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  }
})

-- Set folding method
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
