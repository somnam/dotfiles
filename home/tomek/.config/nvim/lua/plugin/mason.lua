local config = require("core.config")

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    keys = {
      {
        "<Space>t",
        ":Mason<Enter>",
        noremap = true,
        silent = true,
        desc = "Open the Package Manager UI"
      },
    },
    opts = {
      log_level = vim.log.levels.WARN,
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "➜",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {"williamboman/mason.nvim"},
    opts = {
      ensure_installed = config.plugin.mason.ensure_installed,
    }
  }
}
