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
        desc = "Open the Package Manager UI"
      },
    },
    init = function()
      vim.g.python3_host_prog = python.nvim_virtual_env_prog()
    end,
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
    config = function(_, opts)
      require("mason").setup(opts)

      vim.env.PATH = python.remove_pyenv_shims_from_path()
      vim.env.PATH = python.add_virtual_env_bin_to_path()
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {"williamboman/mason.nvim"},
    opts = {
      ensure_installed = config.plugin.mason.ensure_installed,
    }
  }
}
