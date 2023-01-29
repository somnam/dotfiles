local P = {"nvim-tree/nvim-tree.lua"}

P.config = function()
  local nvim_tree = require("nvim-tree")

  local H = {}

  H.mappings = {
    list = {
      { key = "<C-k>", action = "" },
      { key = "<C-x>", action = "" },
      { key = "<C-s>", action = "split" },
      { key = "<F1>",  action = "toggle_help" },
      { key = "<C-f>", action = "toggle_file_info" },
    },
  }

  H.glyphs = {
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
      unstaged = "U",
      staged = "S",
      unmerged = "!",
      renamed = "R",
      untracked = "?",
      deleted = "-",
      ignored = "I",
    },
  }

  -- keymap
  local opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap("n", "<Space>e", ":NvimTreeToggle<Enter>", opts)

  -- setup
  nvim_tree.setup({
    disable_netrw = true,
    sync_root_with_cwd = true,
    view = {
      width = 35,
      mappings = H.mappings,
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "name",
      highlight_modified = "name",
      icons = {
        webdev_colors = false,
        git_placement = "after",
        modified_placement = "before",
        glyphs = H.glyphs,
      },
    },
    filesystem_watchers = {
      debounce_delay = 200,
    },
  })
end

return P
