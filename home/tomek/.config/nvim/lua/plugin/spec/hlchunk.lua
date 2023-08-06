local P = {"shellRaining/hlchunk.nvim"}

P.event = "UIEnter"

P.dependencies = {"nvim-treesitter/nvim-treesitter"}

P.config = function()
  require("hlchunk").setup({
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
  })
end

return P
