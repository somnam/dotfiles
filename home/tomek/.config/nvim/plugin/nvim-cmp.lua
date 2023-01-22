local available, cmp = pcall(require, "cmp")
if not available then return end

local buffer = require("util.buffer")
local icon = require("util.icon").nvim_cmp

-- helper
local H = {}

H.max_size = 1024 * 1024

H.menu_text = {
  nvim_lsp = "[LSP]",
  nvim_lsp_signature_help = "[LSP]",
  buffer = "[Buffer]",
  path = "[Path]",
}

H.blocklist = {
  buftype = {"terminal", "prompt"},
  filetype = {"alpha", "NvimTree"},
}

H.buffer_blocked = function(buf)
  return (
    buffer.blocked(buf, "buftype", H.blocklist.buftype)
    or buffer.blocked(buf, "filetype", H.blocklist.filetype)
  )
end

H.current_buffer_enabled = function()
  return not H.buffer_blocked(vim.api.nvim_get_current_buf())
end

H.get_bufnrs = function()
  local valid_buffers = {}

  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    local invalid_buffer = (
      buffer.above_max_size(buf, H.max_size)
      or not buffer.listed(buf)
      or H.buffer_blocked(buf)
    )
    if not invalid_buffer then
      table.insert(valid_buffers, buf)
    end
  end

  return valid_buffers
end

H.format_field = function(entry, vim_item)
  vim_item.menu = H.menu_text[entry.source.name]
  vim_item.kind = string.format('%s %s', icon.kind_icons[vim_item.kind], vim_item.kind)
  return vim_item
end

H.buffer_option = {
  get_bufnrs = H.get_bufnrs,
  indexing_interval = 500,
}

H.window_option = cmp.config.window.bordered()

-- setup
cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp", group_index = 1 },
    { name = "buffer", group_index = 2, option = H.buffer_option },
    { name = "path", group_index = 3 },
  }),
  enabled = H.current_buffer_enabled,
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
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
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = H.format_field,
  },
  sorting = {
    priority_weight = 1.0,
    comparators = {
      cmp.config.compare.locality,
      cmp.config.compare.recently_used,
      cmp.config.compare.score,
      cmp.config.compare.offset,
      cmp.config.compare.order,
    }
  }
})

