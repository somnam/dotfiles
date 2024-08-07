return {
  {
    "Mofiqul/vscode.nvim",
    event = "ColorSchemePre vscode",
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "vscode",
        group = vim.api.nvim_create_augroup("set_vscode_theme", { clear = true }),
        callback = function()
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2f2f2f" })
        end,
      })
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
  {
    "EdenEast/nightfox.nvim",
    event = "ColorSchemePre *fox",
  },
}
