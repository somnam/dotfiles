local available, telescope = pcall(require, "telescope")
if not available then return end

local vimgrep_arguments = {}
if vim.fn.executable('ack') == 1 then
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

local actions = require('telescope.actions')
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
  dir_icon = '',
  grouped = true,
  hidden = true,
  hijack_netrw = true,
}

telescope.setup({
  defaults={
    preview = {filesize_limit = 1},
    color_devicons = false,
    path_display = {"truncate"},
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {height = 0.8, width = 0.7, prompt_position = "top"},
      vertical = {preview_height = 0.4, width = 0.7, prompt_position = "top"},
      center = {height = 0.5, preview_cutoff = 1},
    },
    results_title = false,
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
vim.api.nvim_set_keymap("n", "<Space>fl", ":Telescope live_grep<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fo", ":Telescope treesitter<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fe", ":Telescope file_browser<Enter>", opts)

