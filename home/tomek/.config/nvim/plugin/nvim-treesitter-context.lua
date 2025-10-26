local buffer = require("util.buffer")
local config = require("util.config")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter-context",
    depends = { "nvim-treesitter/nvim-treesitter" },
  })

  require("treesitter-context").setup({
    line_numbers = false,
    max_lines = 3,
    multiline_threshold = 3,
    on_attach = function(bufnr)
      return not buffer.excluded_or_above_max_size(bufnr, config.get("treesitter.exclude", {}))
    end,
  })
end)
