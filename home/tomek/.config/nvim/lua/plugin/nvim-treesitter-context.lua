local buffer = require("core.buffer")
local treesitter = require("core.treesitter")

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
    max_lines = 3,
    multiline_threshold = 3,
    on_attach = function(buf)
      return not H.maybe_disable_treesitter_context(buf)
    end,
  },
}
