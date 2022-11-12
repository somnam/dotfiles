local available, _ = pcall(require, "nvim-treesitter")
if not available then return end

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = { "json", "yaml", "help" },
    additional_vim_regex_highlighting = false,
  }
})
