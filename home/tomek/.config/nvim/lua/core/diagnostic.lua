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

vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, {
  noremap = true, silent = true, desc = "List all buffer diagnostics"
})
