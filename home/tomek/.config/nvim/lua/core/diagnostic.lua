local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
  "n",
  "<Space>d",
  ":lua vim.diagnostic.setloclist()<Enter>",
  vim.tbl_extend("keep", { desc = "List all buffer diagnostics" }, opts)
)

local signs = { ERROR = "✖", WARN = "▲", INFO = "●", HINT = "⚑" }
local signs_with_space = {}
for type, value in pairs(signs) do
  signs_with_space[type] = value .. " "
end

local diagnostic_opts = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.ERROR,
      [vim.diagnostic.severity.WARN] = signs.WARN,
      [vim.diagnostic.severity.INFO] = signs.INFO,
      [vim.diagnostic.severity.HINT] = signs.HINT,
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

return {
  signs = signs,
  signs_with_space = signs_with_space,
}
