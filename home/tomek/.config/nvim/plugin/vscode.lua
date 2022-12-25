local available, vscode = pcall(require, "vscode")
if not available then return end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="vscode",
  group = vim.api.nvim_create_augroup("set_vscode_theme", { clear = true }),
  callback = function()
    vscode.setup({})
    vim.api.nvim_set_hl(0, "CursorLine", {bg="#282828"})
  end
})
