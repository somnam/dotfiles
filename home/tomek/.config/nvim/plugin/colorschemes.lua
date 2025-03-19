local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({ source = "Mofiqul/vscode.nvim" })

  vim.api.nvim_create_autocmd("ColorSchemePre", {
    pattern = "vscode",
    group = vim.api.nvim_create_augroup("vscode", { clear = true }),
    callback = function()
      require("vscode").setup({
        disable_nvimtree_bg = true,
        group_overrides = {
          MiniStatuslineModeNormal = { link = "Cursor" },
          MiniStatuslineModeInsert = { link = "DiffChange" },
          MiniStatuslineModeVisual = { link = "DiffAdd" },
          MiniStatuslineModeReplace = { link = "DiffDelete" },
          MiniStatuslineModeCommand = { link = "DiffText" },
          MiniStatuslineModeOther = { link = "IncSearch" },
          MiniStatuslineDevinfo = { link = "StatusLine" },
          MiniStatuslineFilename = { link = "StatusLineNC" },
          MiniStatuslineFileinfo = { link = "StatusLine" },
          MiniStatuslineInactive = { link = "StatusLineNC" },
          NvimTreeFolderName = { link = "Directory" },
          NvimTreeEmptyFolderName = { link = "Directory" },
          NvimTreeOpenedFolderName = { link = "Directory" },
          NvimTreeSymlinkFolderName = { link = "Directory" },
        },
      })
    end,
  })
end)

now(function()
  add({ source = "rebelot/kanagawa.nvim" }, { bang = true })

  vim.api.nvim_create_autocmd("ColorSchemePre", {
    pattern = "kanagawa",
    group = vim.api.nvim_create_augroup("kanagawa", { clear = true }),
    callback = function()
      require("kanagawa").setup({
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        colors = {
          theme = {
            all = { ui = { bg_gutter = "none" } },
          },
        },
      })
    end,
  })
end)

now(function()
  add({ source = "catppuccin/nvim", name = "catppuccin" }, { bang = true })

  vim.api.nvim_create_autocmd("ColorSchemePre", {
    pattern = "catppuccin",
    group = vim.api.nvim_create_augroup("catppuccin", { clear = true }),
    callback = function()
      require("catppuccin").setup({
        styles = {
          comments = { "italic" },
          conditionals = {},
        },
      })
    end,
  })
end)
