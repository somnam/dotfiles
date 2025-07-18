local config = require("core.config")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({
    source = "williamboman/mason.nvim",
    hooks = {
      post_install = function()
        vim.cmd("MasonUpdate")
      end,
      post_checkout = function()
        vim.cmd("MasonUpdate")
      end,
    },
  })

  require("mason").setup({
    log_level = vim.log.levels.WARN,
    ui = {
      width = 0.65,
      height = 0.85,
      border = "single",
      icons = {
        package_installed = "✓",
        package_uninstalled = "✗",
        package_pending = "➜",
      },
    },
  })

  vim.keymap.set(
    "n",
    "<leader>t",
    ":Mason<Enter>",
    { noremap = true, silent = true, desc = "Open the Package Manager UI" }
  )
end)

now(function()
  add({
    source = "WhoIsSethDaniel/mason-tool-installer.nvim",
    depends = { "williamboman/mason.nvim" },
  })

  require("mason-tool-installer").setup({
    ensure_installed = config.get("plugin.mason.ensure_installed") or {},
  })
end)
