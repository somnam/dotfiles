local available, _ = pcall(require, "nvim-treesitter")
if not available then return end

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "lua",
    "python",
    "toml",
    "json",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
})

-- Set folding method
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
