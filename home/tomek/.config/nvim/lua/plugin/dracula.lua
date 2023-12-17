return {
  "Mofiqul/dracula.nvim",
  event = "ColorSchemePre dracula",
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "dracula*",
      group = vim.api.nvim_create_augroup("set_dracula_theme", { clear = true }),
      callback = function()
        vim.api.nvim_set_hl(0, "CursorLine", {bg="#343746"})
      end
    })
  end,
  opts = {
    transparent_bg = true,
  }
}
