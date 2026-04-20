Config.now(function()
  vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
  require("mini.notify").setup({
    lsp_progress = { duration_last = 2000 },
  })
end)
