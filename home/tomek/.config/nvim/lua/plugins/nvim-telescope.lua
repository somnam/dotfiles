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
      "--ignore-dir=.cache",
      "--ignore-dir=.mypy_cache",
      "--ignore-dir=.pytest_cache",
  }
end

telescope.setup({
  defaults={
    vimgrep_arguments=vimgrep_arguments,
  },
  pickers = {
    buffers = {
      sort_mru = true,
    },
  },
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>fP", ":Telescope builtin<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fp", ":Telescope oldfiles<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fb", ":Telescope buffers<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>ff", ":Telescope find_files<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fg", ":Telescope git_files<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fl", ":Telescope live_grep<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>fs", ":Telescope treesitter<Enter>", opts)