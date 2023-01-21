local M = {}

M.diagnostic = {
  Error = "ⓧ ",
  Warn = "⚠ ",
  Hint = "⨀ ",
  Info = "ⓘ ",
}

M.dashboard = {
  find_recent = "⏳ ",
  find_file = "🔎 ",
  find_word = "📜 ",
  new_file = "📄 ",
  quit = "❌ ",
}

M.nvim_tree = {
  glyphs = {
    default = "📄",
    symlink = "🔗",
    bookmark = "⭐",
    modified = "🔶",
    folder = {
      arrow_closed = "▶",
      arrow_open = "▼",
      default = "📁",
      open = "📂",
      empty = "📪",
      empty_open = "📭",
      symlink = "📫",
      symlink_open = "📬",
    },
    git = {
      unstaged = "M",
      staged = "S",
      unmerged = "C",
      renamed = "R",
      untracked = "U",
      deleted = "D",
      ignored = "I",
    },
  },
}

M.nvim_cmp = {
  kind_icons = {
    Array = "🅰️ ",
    Boolean = "☯️ ",
    Key = "🔑",
    Namespace = "🪐",
    Null = "☢️ ",
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
    Property = "💊",
    Unit = "✅",
    Value = "🧪",
    Enum = "🧫",
    Keyword = "🔑",
    Snippet = "🌱",
    Color = "🎨",
    File = "📁",
    Reference = "⛳",
    Folder = "📂",
    EnumMember = "🦠",
    Constant = "🧊",
    Struct = "🧱",
    Event = "📅",
    Operator = "❎",
    TypeParameter = "🧬",
  },
}

M.lualine = {
  options = {
    section_separators = {left = "›", right = "‹"},
  }
}

return M
