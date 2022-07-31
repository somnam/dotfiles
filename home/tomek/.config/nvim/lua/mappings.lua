local opts = {noremap = true, silent = true}

vim.keymap.set("i", "<C-c>", "<Esc>", opts)

-- Move between windows
vim.keymap.set("n", "<C-j>", "<C-W>j", opts)
vim.keymap.set("n", "<C-k>", "<C-W>k", opts)
vim.keymap.set("n", "<C-h>", "<C-W>h", opts)
vim.keymap.set("n", "<C-l>", "<C-W>l", opts)

-- Move vertically by visual line
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- Switch buffers
vim.keymap.set("", "<C-Left>", ":bp<Enter>", opts)
vim.keymap.set("", "<C-Right>", ":bn<Enter>", opts)
