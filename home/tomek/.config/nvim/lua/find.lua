local available, telescope = pcall(require, "telescope")
if not available then return end

telescope.setup({
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
vim.api.nvim_set_keymap("n", "<Space>fs", ":Telescope treesitter<Enter>", opts)
