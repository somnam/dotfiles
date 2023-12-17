return {
  "shellRaining/hlchunk.nvim",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {"nvim-treesitter/nvim-treesitter"},
  opts = {
    blank = {
      enable = false,
    },
    chunk = {
      use_treesitter = true,
      chars = {
        horizontal_line = "",
        vertical_line = "│",
        left_top = "┌",
        left_bottom = "└",
        right_arrow = "",
      },
      style = "#00ffff",
      max_file_size = 1024 * 512,
    },
    indent = {
      use_treesitter = false,
      chars = {
        "│",
      },
    },
    line_num = {
      enable = false,
    },
  }
}
