vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- Move between windows
vim.keymap.set("n", "<C-j>", "<C-W>j", opts)
vim.keymap.set("n", "<C-k>", "<C-W>k", opts)
vim.keymap.set("n", "<C-h>", "<C-W>h", opts)
vim.keymap.set("n", "<C-l>", "<C-W>l", opts)

-- Resize windows
vim.keymap.set("n", "<M-Down>", ":resize +2<Enter>", opts)
vim.keymap.set("n", "<M-Up>", ":resize -2<Enter>", opts)
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<Enter>", opts)
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<Enter>", opts)

-- Move vertically by visual line
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- Switch tabs
vim.keymap.set("", "<S-h>", ":tabp<Enter>", opts)
vim.keymap.set("", "<S-l>", ":tabn<Enter>", opts)

-- Clear search and update diff
vim.keymap.set("n", "<Esc>", ":nohlsearch | diffupdate<Enter>", opts)

-- Leader mappings
vim.keymap.set(
  "n",
  "<leader>n",
  ":enew<Enter>",
  vim.tbl_extend("keep", { desc = "Edit a new buffer" }, opts)
)
vim.keymap.set(
  "n",
  "<leader>q",
  ":qall<Enter>",
  vim.tbl_extend("keep", { desc = "Exit Neovim" }, opts)
)

-- Popup menu mappings
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() ~= 0 then
    -- Select first item if none selected.
    local item_selected = vim.fn.complete_info()["selected"] ~= -1
    return item_selected and "<C-y>" or "<C-n><C-y>"
  end

  return "<CR>"
end, { expr = true })

-- Terminal mappings
vim.keymap.set("t", [[<C-w>w]], "<Cmd>wincmd w<CR>", opts)
vim.keymap.set("t", [[<C-w>h]], "<Cmd>wincmd h<CR>", opts)
vim.keymap.set("t", [[<C-w>j]], "<Cmd>wincmd j<CR>", opts)
vim.keymap.set("t", [[<C-w>k]], "<Cmd>wincmd k<CR>", opts)
vim.keymap.set("t", [[<C-w>l]], "<Cmd>wincmd l<CR>", opts)
vim.keymap.set("t", [[<C-w>r]], "<Cmd>wincmd r<CR>", opts)
vim.keymap.set("t", [[<C-w>W]], "<Cmd>wincmd W<CR>", opts)
vim.keymap.set("t", [[<C-w>H]], "<Cmd>wincmd H<CR>", opts)
vim.keymap.set("t", [[<C-w>J]], "<Cmd>wincmd J<CR>", opts)
vim.keymap.set("t", [[<C-w>K]], "<Cmd>wincmd K<CR>", opts)
vim.keymap.set("t", [[<C-w>L]], "<Cmd>wincmd L<CR>", opts)
vim.keymap.set("t", [[<C-w>R]], "<Cmd>wincmd R<CR>", opts)
vim.keymap.set("t", [[<C-w><C-w>]], "<Cmd>wincmd w<CR>", opts)
vim.keymap.set("t", [[<C-w><C-h>]], "<Cmd>wincmd h<CR>", opts)
vim.keymap.set("t", [[<C-w><C-j>]], "<Cmd>wincmd j<CR>", opts)
vim.keymap.set("t", [[<C-w><C-k>]], "<Cmd>wincmd k<CR>", opts)
vim.keymap.set("t", [[<C-w><C-l>]], "<Cmd>wincmd l<CR>", opts)
vim.keymap.set("t", [[<C-w><C-W>]], "<Cmd>wincmd W<CR>", opts)
vim.keymap.set("t", [[<C-w><C-H>]], "<Cmd>wincmd H<CR>", opts)
vim.keymap.set("t", [[<C-w><C-J>]], "<Cmd>wincmd J<CR>", opts)
vim.keymap.set("t", [[<C-w><C-K>]], "<Cmd>wincmd K<CR>", opts)
vim.keymap.set("t", [[<C-w><C-L>]], "<Cmd>wincmd L<CR>", opts)

vim.api.nvim_create_user_command("Term", function()
  vim.cmd("split | term")
  vim.cmd("startinsert")
end, {})
vim.api.nvim_create_user_command("VTerm", function()
  vim.cmd("vsplit | term")
  vim.cmd("startinsert")
end, {})
