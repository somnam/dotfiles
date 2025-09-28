local treesitter = require("util.treesitter")
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
    on_attach = function(buf)
      return not treesitter.maybe_disable_treesitter(buf)
    end,
  })
end)
