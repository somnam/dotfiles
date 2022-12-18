local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>[m", ":lua vim.diagnostic.goto_prev()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>]m", ":lua vim.diagnostic.goto_next()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>m", ":lua vim.diagnostic.open_float()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>M", ":lua vim.diagnostic.setloclist()<Enter>", opts)

local diagnostic_opts = {
  virtual_text = {
    severity = { min = "ERROR" },
  },
  update_in_insert = false,
}
vim.diagnostic.config(diagnostic_opts)
