local available, cmp = pcall(require, "cmp")
if not available then return end

-- helper
local H = {}

H.buffer = require("utils.buffer")

H.max_size = 1024 * 1024

H.menu_text = {
  nvim_lsp = "[LSP]",
  nvim_lsp_signature_help = "[LSP]",
  buffer = "[Buffer]",
  path = "[Path]",
}

H.kind_icons = {
    Text           = "t",
    Method         = "ƒ",
    Function       = "ƒ",
    Constructor    = "c",
    Field          = "𝐟",
    Variable       = "V",
    Class          = "C",
    Interface      = "I",
    Module         = "M",
    Property       = "p",
    Unit           = "U",
    Value          = "v",
    Enum           = "Ε",
    Keyword        = "k",
    Snippet        = "S",
    Color          = "🖌",
    File           = "📁",
    Reference      = "➛",
    Folder         = "📂",
    EnumMember     = "e",
    Constant       = "c",
    Struct         = "{}",
    Event          = "E",
    Operator       = "O",
    TypeParameter  = "T",
}

H.blocklist = {
  buftype = {"terminal", "prompt"},
  filetype = {"alpha", "NvimTree"},
}

H.buffer_blocked = function(buffer)
  return (
    H.buffer.blocked(buffer, "buftype", H.blocklist.buftype)
    or H.buffer.blocked(buffer, "filetype", H.blocklist.filetype)
  )
end

H.current_buffer_enabled = function()
  return not H.buffer_blocked(vim.api.nvim_get_current_buf())
end

H.get_bufnrs = function()
  local valid_buffers = {}

  for _, buffer in pairs(vim.api.nvim_list_bufs()) do
    local invalid_buffer = (
      H.buffer.above_max_size(buffer, H.max_size)
      or not H.buffer.listed(buffer)
      or H.buffer_blocked(buffer)
    )
    if not invalid_buffer then
      table.insert(valid_buffers, buffer)
    end
  end

  return valid_buffers
end

H.format_field = function(entry, vim_item)
  vim_item.menu = H.menu_text[entry.source.name]
  vim_item.kind = string.format('%s %s', H.kind_icons[vim_item.kind], vim_item.kind)
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

