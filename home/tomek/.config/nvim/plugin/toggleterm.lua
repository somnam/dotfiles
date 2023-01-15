local available, toggleterm = pcall(require, "toggleterm")
if not available then return end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*toggleterm#*",
  group = vim.api.nvim_create_augroup("toggleterm_keymaps", { clear = true }),
  callback = function()
    local opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap("t", "<C-[>", [[<C-\><C-n>]], opts)
    vim.api.nvim_set_keymap("t", "<C-W><C-W>", "<Cmd>wincmd w<Enter>", opts)
  end
})

local function size(term)
  if term.direction == "horizontal" then
    return math.floor(vim.o.lines * 0.25)
  elseif term.direction == "vertical" then
    return math.floor(vim.o.columns * 0.5)
  end
end

toggleterm.setup({
  open_mapping = [[<C-\>]],
  size = size,
  autochdir = true,
})
