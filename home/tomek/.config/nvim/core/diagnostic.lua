vim.diagnostic.config({
  float = {
    border = "single",
    focusable = true,
    source = true,
  },
  severity_sort = true,
  underline = false,
  virtual_text = {
    current_line = true,
    prefix = "",
    source = true,
  },
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, {
  noremap = true,
  silent = true,
  desc = "List all buffer diagnostics",
})
