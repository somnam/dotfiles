local buffer = require("core.buffer")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({
    source = "hrsh7th/nvim-cmp",
    depends = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
  })

  local H = {
    max_size = 1024 * 1024,
    max_label_width = 50,
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

  H.truncate_abbr = function(abbr)
    if #abbr > H.max_label_width then
      return vim.fn.strcharpart(abbr, 0, H.max_label_width) .. "…"
    end

    return abbr
  end

  local cmp = require("cmp")
  cmp.setup({
    sources = {
      { name = "nvim_lsp", group_index = 1 },
      {
        name = "buffer",
        group_index = 2,
        keyword_length = 3,
        option = {
          get_bufnrs = H.get_bufnrs,
          indexing_interval = 500,
        },
      },
      { name = "path", group_index = 3 },
    },
    enabled = H.current_buffer_enabled,
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    snippet = {
      expand = function(arg)
        vim.snippet.expand(arg.body)
      end,
    },
    performance = {
      debounce = 50,
      fetching_timeout = 200,
      max_view_entries = 50,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(_, vim_item)
        vim_item.abbr = H.truncate_abbr(vim_item.abbr)
        return vim_item
      end,
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.locality,
        cmp.config.compare.recently_used,
      },
    },
    matching = {
      disallow_fullfuzzy_matching = true,
    },
  })
end)
