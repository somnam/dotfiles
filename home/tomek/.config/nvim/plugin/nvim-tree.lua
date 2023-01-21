local available, nvim_tree = pcall(require, "nvim-tree")
if not available then return end

local icon = require("utils.icon").nvim_tree

-- helper
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
      glyphs = icon.glyphs,
    },
  },
  filesystem_watchers = {
    debounce_delay = 200,
  },
})
