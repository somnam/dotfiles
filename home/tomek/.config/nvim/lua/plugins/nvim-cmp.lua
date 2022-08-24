local available, cmp = pcall(require, "cmp")
local buffer_available, cmp_buffer = pcall(require, "cmp_buffer")
if not(available and buffer_available) then return end

local menu_text = {
  nvim_lsp = "[LSP]",
  nvim_lsp_signature_help = "[LSP]",
  buffer = "[Buffer]",
  path = "[Path]",
}

local window = {
  border = 'rounded',
  col_offset = 0,
  side_padding = 1,
}

local function get_bufnrs()
  -- Index only open buffers up to 1 megabyte size.

  local valid_buffers = {}
  local max_size = 1024 * 1024

  for _, buffer in pairs(vim.api.nvim_list_bufs()) do
    local buffer_size = vim.api.nvim_buf_get_offset(buffer, vim.api.nvim_buf_line_count(buffer))
    if buffer_size > max_size then
      goto continue
    end

    local buffer_listed = vim.fn.buflisted(buffer) == 1
    local buffer_terminal = vim.fn.getbufvar(buffer, '&buftype', 'ERROR') == 'terminal'
    if buffer_listed or buffer_terminal then
      table.insert(valid_buffers, buffer)
    end

    ::continue::
  end

  return valid_buffers
end

cmp.setup({
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      {
        name = 'buffer',
        option = {
          get_bufnrs = get_bufnrs,
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
