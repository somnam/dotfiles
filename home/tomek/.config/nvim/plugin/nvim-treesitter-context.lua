local buffer = require("core.buffer")
local treesitter = require("core.treesitter")
local add = require("mini.deps").add
local later = require("mini.deps").later

local H = {}

H.maybe_disable_treesitter_context = function(buf)
  return (
    buffer.excluded(buf, treesitter.exclude_filetype)
    or buffer.above_max_size(buf, treesitter.max_size)
  )
end

later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter-context",
    depends = { "nvim-treesitter/nvim-treesitter" },
  })
  require("treesitter-context").setup({
    line_numbers = false,
    max_lines = 3,
    multiline_threshold = 3,
    on_attach = function(buf)
      return not H.maybe_disable_treesitter_context(buf)
    end,
  })
end)
