local opts = { noremap = true, silent = true }

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

-- Clear search and update diff
vim.api.nvim_set_keymap("n", "<Esc>", ":mode | nohlsearch | diffupdate<Enter>", opts)

-- Leader mappings
vim.api.nvim_set_keymap(
  "n",
  "<Space>n",
  ":enew<Enter>",
  vim.tbl_extend("keep", { desc = "Edit a new buffer" }, opts)
)
vim.api.nvim_set_keymap(
  "n",
  "<Space>q",
  ":qall<Enter>",
  vim.tbl_extend("keep", { desc = "Exit Neovim" }, opts)
)

-- Snippet mappings
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<cmd>lua vim.snippet.jump(1)<Enter>"
  end
  return "<Tab>"
end, { expr = true })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if vim.snippet.active({ direction = -1 }) then
    return "<cmd>lua vim.snippet.jump(-1)<Enter>"
  end
  return "<S-Tab>"
end, { expr = true })
