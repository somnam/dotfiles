local config = require("core.config")

return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      lazy = false,
      opts = {
        ensure_installed = config.plugin.mason.ensure_installed,
      },
    },
  },
  keys = {
    {
      "<Space>t",
      ":Mason<Enter>",
      noremap = true,
      silent = true,
      desc = "Open the Package Manager UI",
    },
  },
  opts = {
    log_level = vim.log.levels.WARN,
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.8,
      icons = {
        package_installed = "✓",
        package_uninstalled = "✗",
        package_pending = "➜",
      },
    },
  },
}
