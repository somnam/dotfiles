local available, dracula = pcall(require, "dracula")
if not available then return end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="dracula",
  group = vim.api.nvim_create_augroup("set_dracula_theme", { clear = true }),
  callback = function()
    dracula.setup({})
    vim.api.nvim_set_hl(0, "CursorLine", {bg="#333649"})
  end
})