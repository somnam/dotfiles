local P = {"rebelot/kanagawa.nvim"}

P.event = "ColorSchemePre kanagawa"

P.config = function()
  require('kanagawa').setup({
    commentStyle = {italic = false},
    keywordStyle = {italic = false},
  })
end

return P
