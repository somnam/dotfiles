local available, cmp = pcall(require, "cmp")
local buffer_available, cmp_buffer = pcall(require, "cmp_buffer")
if not(available and buffer_available) then return end

local menu_text = {
  nvim_lsp = "[LSP]",
  buffer = "[Buffer]",
  path = "[Path]",
}

local window = {
  border = 'rounded',
  col_offset = 0,
  side_padding = 1,
}

cmp.setup({
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
    },
    {
      {
        name = 'buffer',
        option = {
          get_bufnrs = function() return vim.api.nvim_list_bufs() end,
        }
      },
      { name = 'path' },
    }
  ),
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = window,
    documentation = window,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      vim_item.menu = menu_text[entry.source.name]
      return vim_item
    end,
  },
})
