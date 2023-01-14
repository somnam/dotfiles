local available, nvim_tree = pcall(require, "nvim-tree")
if not available then return end

nvim_tree.setup({
  disable_netrw = true,
  sync_root_with_cwd = true,
  view = {
    mappings = {
      list = {
        { key = "<C-k>", action = "" },
        { key = "<C-x>", action = "" },
        { key = "<C-s>", action = "split" },
        { key = "<F1>",  action = "toggle_help" },
        { key = "<C-f>", action = "toggle_file_info" },
      },
    },
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "name",
    highlight_modified = "name",
    icons = {
      webdev_colors = false,
      git_placement = "after",
      modified_placement = "before",
      glyphs = {
        default = "",
        symlink = "➛",
        bookmark = "★",
        modified = "●",
        folder = {
          arrow_closed = "▶",
          arrow_open = "▼",
          default = "📁",
          open = "📂",
          empty = "📂",
          empty_open = "📂",
          symlink = "➛",
          symlink_open = "➛",
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
      }
    },
  },
  filesystem_watchers = {
    debounce_delay = 200,
  },
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>e", ":NvimTreeToggle<Enter>", opts)
