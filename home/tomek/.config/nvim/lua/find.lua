local available, _ = pcall(require, "telescope")
if not available then return end

require("telescope").setup({
 pickers = {
   buffers = {
     sort_mru = true,
   },
 },
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>fP", ":Telescope builtin<Enter>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<Enter>", opts)
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<Enter>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope git_files<Enter>", opts)
vim.api.nvim_set_keymap("n", "<leader>fo", ":Telescope oldfiles<Enter>", opts)
vim.api.nvim_set_keymap("n", "<leader>fs", ":Telescope treesitter<Enter>", opts)
