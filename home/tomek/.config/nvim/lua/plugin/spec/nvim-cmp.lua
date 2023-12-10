return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {"L3MON4D3/LuaSnip"},
    },
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local buffer = require("util.buffer")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    local H = {}

    H.max_size = 1024 * 1024

    H.max_label_width = 50

    H.menu_text = {
      nvim_lsp = "[LSP]",
      luasnip = "[Snippet]",
      buffer = "[Buffer]",
      path = "[Path]",
    }

    H.current_buffer_enabled = function()
      return not buffer.excluded(vim.api.nvim_get_current_buf())
    end

    H.get_bufnrs = function()
      local valid_buffers = {}

      for _, bufnr in pairs(vim.api.nvim_list_bufs()) do
        local invalid_buffer = (
          buffer.above_max_size(bufnr, H.max_size)
          or not buffer.listed(bufnr)
          or buffer.excluded(bufnr)
        )
        if not invalid_buffer then
          table.insert(valid_buffers, bufnr)
        end
      end

      return valid_buffers
    end

    H.format_field = lspkind.cmp_format({
      mode = "symbol_text",
      menu = H.menu_text,
      preset = "codicons",
      maxwidth = H.max_label_width,
      ellipsis_char = "…",
    })

    H.buffer_option = {
      get_bufnrs = H.get_bufnrs,
      indexing_interval = 500,
    }

    H.window_option = cmp.config.window.bordered()

    -- setup
    cmp.setup({
      sources = {
        { name = "nvim_lsp", group_index = 1 },
        { name = "buffer", group_index = 2, option = H.buffer_option },
        { name = "luasnip", group_index = 3 },
        { name = "path", group_index = 4 },
      },
      enabled = H.current_buffer_enabled,
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      performance = {
        debounce = 150,
      },
      window = {
        completion = H.window_option,
        documentation = H.window_option,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-l>"] = cmp.mapping(
          function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif not luasnip.in_snippet() then
              fallback()
            end
          end,
          {"i", "s"}
        ),
        ["<C-h>"] = cmp.mapping(
          function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            elseif not luasnip.in_snippet() then
              fallback()
            end
          end,
          {"i", "s"}
        ),
      }),
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = H.format_field,
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.order,
        }
      }
    })
  end
}
