return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VimEnter",
  opts = {
    line_numbers = false,
    multiline_threshold = 3,
  }
}
