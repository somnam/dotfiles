local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
  "n",
  "<Space>m",
  ":lua vim.diagnostic.open_float()<Enter>",
  vim.tbl_extend("keep", { desc = "List cursor line diagnostics" }, opts)
)
vim.api.nvim_set_keymap(
  "n",
  "<Space>M",
  ":lua vim.diagnostic.setloclist()<Enter>",
  vim.tbl_extend("keep", { desc = "List all buffer diagnostics" }, opts)
)

local diagnostic_opts = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✖",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.INFO] = "●",
      [vim.diagnostic.severity.HINT] = "○",
    },
  },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
    prefix = "",
    source = true,
  },
  underline = false,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = true,
  },
}
vim.diagnostic.config(diagnostic_opts)
