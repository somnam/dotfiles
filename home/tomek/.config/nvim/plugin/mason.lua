local config = require("util.config")
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

  local H = {}

  ---@type string[]
  H.ensure_installed = config.get("plugin.mason.ensure_installed", {})

  ---@package_name string
  H.install_package = function(package_name)
    require("mason-registry").get_package(package_name):install()
    require("mason-core.notify")(string.format("Installing package %s.", package_name))
  end

  H.check_installed_packages = function()
    local installed_packages = require("mason-registry").get_installed_package_names()
    for _, package_name in ipairs(H.ensure_installed) do
      if not vim.tbl_contains(installed_packages, package_name) then
        pcall(H.install_package, package_name)
      end
    end
  end

  require("mason").setup({
    log_level = vim.log.levels.WARN,
    ui = {
      width = 0.65,
      height = 0.85,
      border = "single",
    },
  })

  H.check_installed_packages()

  vim.keymap.set(
    "n",
    "<leader>t",
    ":Mason<Enter>",
    { noremap = true, silent = true, desc = "Open the Package Manager UI" }
  )
end)
