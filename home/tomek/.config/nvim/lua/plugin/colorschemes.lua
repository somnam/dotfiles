return {
  {
    "Mofiqul/vscode.nvim",
    event = "ColorSchemePre vscode",
  },
  {
    "rebelot/kanagawa.nvim",
    event = "ColorSchemePre kanagawa",
    opts = {
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      colors = {
        theme = {
          all = { ui = { bg_gutter = "none" } },
        },
      },
    },
  },
}
