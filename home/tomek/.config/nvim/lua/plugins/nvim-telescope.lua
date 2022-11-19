local available, telescope = pcall(require, "telescope")
if not available then return end

local vimgrep_arguments = {}
if vim.fn.executable("ack") == 1 then
  vimgrep_arguments = {
      "ack",
      "--nocolor",
      "--nogroup",
      "--column",
      "--smart-case",
      "--ignore-dir=.venv",
      "--ignore-dir=.cache",
      "--ignore-dir=.mypy_cache",
      "--ignore-dir=.pytest_cache",
  }
end

local actions = require("telescope.actions")
local mappings = {
  ["<C-f>"] = actions.preview_scrolling_down,
  ["<C-b>"] = actions.preview_scrolling_up,
  ["<C-u>"] = false,
  ["<C-d>"] = false,
}
local buffer_mappings = {
  ["<C-d>"] = actions.delete_buffer,
}

local file_browser = {
  dir_icon = "📁",
  grouped = true,
  hidden = true,
  hijack_netrw = true,
}

local dropdown = require("telescope.themes").get_dropdown({
  layout_config = {width = 0.5, height = 0.6},
})

telescope.setup({
  defaults={
    preview = false,
    color_devicons = false,
    path_display = {truncate = 3},
    results_title = dropdown.results_title,
    sorting_strategy = dropdown.sorting_strategy,
    layout_strategy = dropdown.layout_strategy,
    layout_config = dropdown.layout_config,
    border = dropdown.border,
    borderchars = dropdown.borderchars,
    mappings = {i = mappings, n = mappings},
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    buffers = {
      sort_mru = true,
      mappings = {i = buffer_mappings, n = buffer_mappings},
    },
  },
  extensions = {
    file_browser = file_browser,
  }
})

telescope.load_extension("file_browser")

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>fp", ":Telescope oldfiles<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fb", ":Telescope buffers<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>ff", ":Telescope find_files<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fg", ":Telescope git_status<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fw", ":Telescope live_grep<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fo", ":Telescope treesitter<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fe", ":Telescope file_browser<Enter>", opts)
