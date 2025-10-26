local buffer = require("util.buffer")
local config = require("util.config")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({
    source = "shellRaining/hlchunk.nvim",
    depends = { "nvim-treesitter/nvim-treesitter" },
  })

  local H = {}

  H.exclude_filetypes = function()
    local exclude_filetypes = {}
    for _, filetype in ipairs(config.get("treesitter.exclude", {})) do
      exclude_filetypes[filetype] = true
    end
    return exclude_filetypes
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
      exclude_filetypes = H.exclude_filetypes(),
    },
    indent = { enable = false },
    line_num = { enable = false },
  })
end)
