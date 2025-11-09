vim.diagnostic.config({
  virtual_text = {
    prefix = "",
    source = true,
    current_line = true,
  },
  underline = false,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = true,
    border = "single",
    source = true,
  },
})

vim.api.nvim_set_keymap(
  "n",
  "<leader>d",
  ":lua vim.diagnostic.setloclist()<Enter>",
  { noremap = true, silent = true, desc = "List all buffer diagnostics" }
)
