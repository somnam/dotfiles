local available, cmp = pcall(require, "cmp")
if not available then return end

local M = {}

M.buffer = require("utils.buffer")

M.max_size = 1024 * 1024

M.menu_text = {
  nvim_lsp = "[LSP]",
  nvim_lsp_signature_help = "[LSP]",
  buffer = "[Buffer]",
  path = "[Path]",
}

M.kind_icons = {
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

M.blocklist = {
  buftype = {"terminal"},
  filetype = {"alpha", "NvimTree"},
}

M.buffer_blocked = function(buffer)
  return (
    M.buffer.blocked(buffer, "buftype", M.blocklist.buftype)
    or M.buffer.blocked(buffer, "filetype", M.blocklist.filetype)
  )
end

M.current_buffer_enabled = function()
  return not M.buffer_blocked(vim.api.nvim_get_current_buf())
end

M.get_bufnrs = function()
  local valid_buffers = {}

  for _, buffer in pairs(vim.api.nvim_list_bufs()) do
    local invalid_buffer = (
      M.buffer.above_max_size(buffer, max_size)
      or not M.buffer.listed(buffer)
      or M.buffer_blocked(buffer)
    )
    if not invalid_buffer then
      table.insert(valid_buffers, buffer)
    end
  end

  return valid_buffers
end

M.format_field = function(entry, vim_item)
  vim_item.menu = M.menu_text[entry.source.name]
  vim_item.kind = string.format('%s %s', M.kind_icons[vim_item.kind], vim_item.kind)
  return vim_item
end

M.buffer_option = {
  get_bufnrs = get_bufnrs,
  indexing_interval = 500,
}

M.window_option = cmp.config.window.bordered()

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp", group_index = 1 },
    { name = "buffer", group_index = 2, option = M.buffer_option },
    { name = "path", group_index = 3 },
  }),
  enabled = M.current_buffer_enabled,
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = M.window_option,
    documentation = M.window_option,
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
    format = M.format_field,
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

