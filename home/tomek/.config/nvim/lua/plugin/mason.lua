local config = require("core.config")
local python = require("util.python")

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
    config = function(_, opts)
      python.set_nvim_virtual_env_prog()

      require("mason").setup(opts)

      python.remove_pyenv_shims_from_path()
      python.add_virtual_env_bin_to_path()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = config.plugin.mason.ensure_installed,
    },
  },
}
