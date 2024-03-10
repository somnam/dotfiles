return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "echo 'NOTE: jsregexp is optional\n'; make install_jsregexp",
    event = "InsertEnter",
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      return require("util.misc").map_extend(opts, {
        sources = { { name = "luasnip", group_index = 3 } },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif not luasnip.in_snippet() then
              fallback()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            elseif not luasnip.in_snippet() then
              fallback()
            end
          end, { "i", "s" }),
        },
      })
    end,
  },
}
