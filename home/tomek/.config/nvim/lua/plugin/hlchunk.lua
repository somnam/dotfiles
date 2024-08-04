return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    blank = { enable = false },
    chunk = {
      enable = true,
      use_treesitter = true,
      chars = {
        vertical_line = "│",
        left_top = "┌",
        left_bottom = "└",
        left_arrow = "",
        right_arrow = "",
      },
      duration = 0,
      max_file_size = 1024 * 512,
    },
    indent = { enable = false },
    line_num = { enable = false },
  },
}
