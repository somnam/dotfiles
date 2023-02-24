local P = {"folke/tokyonight.nvim"}

P.event = {
  "ColorSchemePre tokyonight",
  "ColorSchemePre tokyonight-night",
  "ColorSchemePre tokyonight-storm",
  "ColorSchemePre tokyonight-day",
  "ColorSchemePre tokyonight-moon",
}

P.config = function()
  require('tokyonight').setup({
    styles = {
      keywords = { italic = false },
    },
    lualine_bold = true,
  })
end

return P
