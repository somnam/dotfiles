local P = {"Mofiqul/dracula.nvim"}

P.event = "ColorSchemePre dracula"

P.config = function()
  local dracula = require("dracula")

  -- autocmd
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern="dracula",
    group = vim.api.nvim_create_augroup("set_dracula_theme", { clear = true }),
    callback = function()
      vim.api.nvim_set_hl(0, "CursorLine", {bg="#333649"})
    end
  })

  -- setup
  dracula.setup({})
end

return P