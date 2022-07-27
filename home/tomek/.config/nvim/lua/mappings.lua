local opts = {noremap = true, silent = true}

-- Move between windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", opts)

-- Move vertically by visual line
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)

-- Switch buffers
vim.api.nvim_set_keymap("", "<C-Left>", ":bp<Enter>", opts)
vim.api.nvim_set_keymap("", "<C-Right>", ":bn<Enter>", opts)
