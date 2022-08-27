local available, cmp = pcall(require, "cmp")
local buffer_available, cmp_buffer = pcall(require, "cmp_buffer")
if not(available and buffer_available) then return end

local function buffer_listed(buffer)
  return vim.fn.buflisted(buffer) == 1
end

local function buffer_terminal(buffer)
  return vim.fn.getbufvar(buffer, '&buftype', 'ERROR') == 'terminal'
end

local function buffer_above_max_size(buffer, max_size)
  local buffer_size = vim.api.nvim_buf_get_offset(buffer, vim.api.nvim_buf_line_count(buffer))
  return buffer_size > max_size
end

local function get_bufnrs()
  -- Index only open buffers up to 1 megabyte size.

  local valid_buffers = {}
  local max_size = 1024 * 1024

  for _, buffer in pairs(vim.api.nvim_list_bufs()) do
    if buffer_above_max_size(buffer, max_size) then
      goto continue
    end

    if not(buffer_listed(buffer) or buffer_terminal(buffer)) then
      goto continue
    end

    table.insert(valid_buffers, buffer)

    ::continue::
  end

  return valid_buffers
end

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

local buffer_option = {
  get_bufnrs = get_bufnrs,
  indexing_interval = 250,
}

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp', group_index = 1 },
    { name = 'nvim_lsp_signature_help', group_index = 1 },
    { name = 'buffer', group_index = 2, option = buffer_option },
    { name = 'path', group_index = 3 },
  }),
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
