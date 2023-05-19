local P = {"hrsh7th/nvim-cmp"}

P.event = "InsertEnter"

P.requires = {
  {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"},
  {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
  {"hrsh7th/cmp-path", after = "nvim-cmp"},
}

P.config = function()
  local cmp = require("cmp")
  local buffer = require("util.buffer")

  local H = {}

  H.max_size = 1024 * 1024

  H.max_label_width = 50

  H.menu_text = {
    nvim_lsp = "[LSP]",
    nvim_lsp_signature_help = "[LSP]",
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

  H.truncate_label = function(label)
    if #label > H.max_label_width then
      return vim.fn.strcharpart(label, 0, H.max_label_width) .. '…'
    end

    return label
  end

  H.kind_icons = {
    Array = "🅰️ ",
    Boolean = "☯️ ",
    Key = "🔑",
    Namespace = "🗃️",
    Null = "0️⃣ ",
    Number = "🔢",
    Object = "🅾️ ",
    Package = "🕋",
    String = "🔠",
    Text = "📜",
    Method = "🧶",
    Function = "🧵",
    Constructor = "🚧",
    Field = "🔘",
    Variable = "🔷",
    Class = "📦",
    Interface = "🧩",
    Module = "📦",
    Property = "🔵",
    Unit = "🗳️",
    Value = "💲",
    Enum = "🧫",
    Keyword = "🔑",
    Snippet = "✂️ ",
    Color = "🎨",
    File = "📁",
    Reference = "↔️ ",
    Folder = "📂",
    EnumMember = "🦠",
    Constant = "🧊",
    Struct = "🧱",
    Event = "📅",
    Operator = "❎",
    TypeParameter = "🧬",
  }

  H.format_field = function(entry, vim_item)
    vim_item.menu = H.menu_text[entry.source.name]
    vim_item.kind = string.format('%s %s', H.kind_icons[vim_item.kind], vim_item.kind)
    vim_item.abbr = H.truncate_label(vim_item.abbr)
    return vim_item
  end

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
      { name = "path", group_index = 3 },
    },
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
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.locality,
        cmp.config.compare.recently_used,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.kind,
        cmp.config.compare.order,
      }
    }
  })
end

return P
