local buffer = require("util.buffer")
local treesitter = require("util.treesitter")

local H = {}

H.maybe_disable_treesitter_context = function(buf)
  return (
    buffer.excluded(buf, treesitter.exclude_filetype)
    or buffer.above_max_size(buf, treesitter.max_size)
  )
end

return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    line_numbers = false,
    multiline_threshold = 3,
    on_attach = function(buf)
      return not H.maybe_disable_treesitter_context(buf)
    end,
  },
}
