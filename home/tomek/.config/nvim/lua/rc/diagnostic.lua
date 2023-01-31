local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>[m", ":lua vim.diagnostic.goto_prev()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>]m", ":lua vim.diagnostic.goto_next()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>m", ":lua vim.diagnostic.open_float()<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>M", ":lua vim.diagnostic.setloclist()<Enter>", opts)

local icons = {Error = "●", Warn = "▲", Hint = "◆", Info = "■"}

for type, glyph in pairs(icons) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = glyph, texthl = hl, numhl = hl })
end

local diagnostic_opts = {
  virtual_text = {
    severity = {min = vim.diagnostic.severity.ERROR},
    prefix = "↳",
  },
  update_in_insert = false,
  severity_sort = true,
}
vim.diagnostic.config(diagnostic_opts)
