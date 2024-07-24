return {
  {
    "tomasiser/vim-code-dark",
    event = "ColorSchemePre codedark",
    config = function()
      vim.g.codedark_italics = 1
      vim.cmd.colorscheme("codedark")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    event = "ColorSchemePre gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    event = "ColorSchemePre kanagawa",
    opts = {
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
    },
  },
}
