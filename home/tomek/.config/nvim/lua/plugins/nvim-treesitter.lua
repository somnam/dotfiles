local available, _ = pcall(require, "nvim-treesitter")
if not available then return end

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "bash",
    "lua",
    "make",
    "markdown",
    "python",
    "toml",
  },
  sync_install = true,
  highlight = {
    enable = true,
    disable = { "json", "yaml" },
    additional_vim_regex_highlighting = false,
  }
})
