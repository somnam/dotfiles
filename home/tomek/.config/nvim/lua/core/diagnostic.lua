local M = {
  signs = { ERROR = "✖", WARN = "▲", INFO = "●", HINT = "⚑" },
}

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = M.signs.ERROR,
      [vim.diagnostic.severity.WARN] = M.signs.WARN,
      [vim.diagnostic.severity.INFO] = M.signs.INFO,
      [vim.diagnostic.severity.HINT] = M.signs.HINT,
    },
  },
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

return M
