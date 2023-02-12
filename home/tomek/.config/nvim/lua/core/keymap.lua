local opts = {noremap = true, silent = true}

-- Move between windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", opts)

-- Resize windows
vim.api.nvim_set_keymap("n", "<M-Down>", ":resize +2<Enter>", opts)
vim.api.nvim_set_keymap("n", "<M-Up>", ":resize -2<Enter>", opts)
vim.api.nvim_set_keymap("n", "<M-Left>", ":vertical resize -2<Enter>", opts)
vim.api.nvim_set_keymap("n", "<M-Right>", ":vertical resize +2<Enter>", opts)

-- Move vertically by visual line
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)

-- Switch tabs
vim.api.nvim_set_keymap("", "<S-h>", ":tabp<Enter>", opts)
vim.api.nvim_set_keymap("", "<S-l>", ":tabn<Enter>", opts)

-- Leader mappings
vim.api.nvim_set_keymap("n", "<Space>n", ":enew<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>q", ":qall<Enter>", opts)