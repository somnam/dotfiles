local buffer = require("util.buffer")
local config = require("util.config")

Config.on_filetype("*", function()
  vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/shellRaining/hlchunk.nvim",
  })

  local exclude_filetypes = {}
  for _, filetype in ipairs(config.get("treesitter.exclude", {})) do
    exclude_filetypes[filetype] = true
  end

  require("hlchunk").setup({
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
      max_file_size = buffer.max_size,
      exclude_filetypes = exclude_filetypes,
    },
    indent = { enable = false },
    line_num = { enable = false },
  })
end)
