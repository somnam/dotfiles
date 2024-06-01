return {
  {
    "onsails/lspkind.nvim",
    event = "InsertEnter",
    config = function()
      require("lspkind").init({
        mode = "symbol_text",
        preset = "codicons",
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      return require("util.misc").deep_extend(opts, {
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = require("lspkind").cmp_format({
            maxwidth = 50,
            ellipsis_char = "…",
          }),
        },
      })
    end,
  },
}
