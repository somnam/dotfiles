local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>d[", ":lua vim.diagnostic.goto_prev()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>d]", ":lua vim.diagnostic.goto_next()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>dm", ":lua vim.diagnostic.setloclist()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>dd", ":lua vim.diagnostic.open_float()<Enter>", opts)

local diagnostic_opts = {
  virtual_text = {
    severity = { min = "ERROR" },
  },
  update_in_insert = false,
}
vim.diagnostic.config(diagnostic_opts)
