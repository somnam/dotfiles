local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap(
  "n", "<Space>[m", ":lua vim.diagnostic.goto_prev()<Enter>",
  vim.tbl_extend("keep", {desc = "Go to previous diagnostic"}, opts)
)
vim.api.nvim_set_keymap(
  "n", "<Space>]m", ":lua vim.diagnostic.goto_next()<Enter>",
  vim.tbl_extend("keep", {desc = "Go to next diagnostic"}, opts)
)
vim.api.nvim_set_keymap(
  "n", "<Space>m", ":lua vim.diagnostic.open_float()<Enter>",
  vim.tbl_extend("keep", {desc = "List cursor line diagnostics"}, opts)
)
vim.api.nvim_set_keymap(
  "n", "<Space>M", ":lua vim.diagnostic.setloclist()<Enter>",
  vim.tbl_extend("keep", {desc = "List all buffer diagnostics"}, opts)
)

local icons = {
    [vim.diagnostic.severity.ERROR] = {hl = "DiagnosticSignError", glyph = "󰅚 "},
    [vim.diagnostic.severity.WARN] = {hl = "DiagnosticSignWarn", glyph = "󰀪 "},
    [vim.diagnostic.severity.INFO] = {hl = "DiagnosticSignInfo", glyph = "󰋽 "},
    [vim.diagnostic.severity.HINT] = {hl = "DiagnosticSignHint", glyph = "󰌶 "},
}

for _, icon in pairs(icons) do
	vim.fn.sign_define(icon.hl, {text = icon.glyph, texthl = icon.hl, numhl = icon.hl})
end

local diagnostic_opts = {
  virtual_text = {
    severity = {min = vim.diagnostic.severity.ERROR},
    prefix = "",
    source = true,
  },
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
