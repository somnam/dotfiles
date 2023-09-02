local P = {"Mofiqul/dracula.nvim"}

P.event = "ColorSchemePre dracula"

P.config = function()
  -- autocmd
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "dracula*",
    group = vim.api.nvim_create_augroup("set_dracula_theme", { clear = true }),
    callback = function()
      vim.api.nvim_set_hl(0, "CursorLine", {bg="#343746"})
    end
  })

  -- setup
  require("dracula").setup({
    transparent_bg = true,
  })
end

return P
