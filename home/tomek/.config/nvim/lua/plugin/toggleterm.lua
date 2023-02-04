local P = {"akinsho/toggleterm.nvim"}

P.config = function()
  local toggleterm = require("toggleterm")

  local H = {}

  H.size = function(term)
    if term.direction == "horizontal" then
      return math.floor(vim.o.lines * 0.25)
    elseif term.direction == "vertical" then
      return math.floor(vim.o.columns * 0.5)
    end
  end

  -- autocmd
  vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*toggleterm#*",
    group = vim.api.nvim_create_augroup("toggleterm_keymaps", { clear = true }),
    callback = function()
      local opts = {noremap = true, silent = true}
      vim.api.nvim_buf_set_keymap(0, "t", "<C-[>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-w><C-w>", "<Cmd>wincmd w<Enter>", opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<Cmd>wincmd k<Enter>", opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Cmd>wincmd j<Enter>", opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<M-Down>", "<Cmd>resize -1<Enter>", opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<M-Up>", "<Cmd>resize +1<Enter>", opts)
    end
  })

  -- setup
  toggleterm.setup({
    open_mapping = [[<C-\>]],
    size = H.size,
    autochdir = true,
  })
end

return P