local opts = {noremap = true, silent = true}

-- Move between windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", opts)

-- Move vertically by visual line
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)

-- Switch tabs
vim.api.nvim_set_keymap("", "<S-h>", ":tabp<Enter>", opts)
vim.api.nvim_set_keymap("", "<S-l>", ":tabn<Enter>", opts)

-- Leader mappings
vim.api.nvim_set_keymap("n", "<Space>n", ":enew<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>q", ":qall<Enter>", opts)

-- Terminal mappings
vim.api.nvim_set_keymap("t", "<C-[>", [[<C-\><C-n>]], opts)
vim.api.nvim_set_keymap("n", "<Space>t", ":vs | te<Enter>", opts)
