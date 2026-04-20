local config = require("util.config")

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "mason.nvim" and ev.data.kind == "update" then
      vim.cmd("silent! MasonUpdate")
    end
  end,
})

Config.now(function()
  vim.pack.add({ "https://github.com/williamboman/mason.nvim" })

  ---@type string[]
  local ensure_installed = config.get("plugin.mason.ensure_installed", {})
  ---@type table
  local mason_registry = require("mason-registry")
  ---@type function
  local mason_notify = require("mason-core.notify")

  ---@package_name string
  local function install_package(package_name)
    mason_registry.get_package(package_name):install()
    mason_notify(string.format("Installing package %s.", package_name))
  end

  ---@return table<string, boolean>
  local function get_installed_packages()
    local installed_packages = {}
    for _, name in ipairs(mason_registry.get_installed_package_names()) do
      installed_packages[name] = true
    end
    return installed_packages
  end

  local function check_installed_packages()
    local installed_packages = get_installed_packages()
    for _, package_name in ipairs(ensure_installed) do
      if not installed_packages[package_name] then
        pcall(install_package, package_name)
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

  check_installed_packages()

  vim.keymap.set(
    "n",
    "<leader>t",
    ":Mason<Enter>",
    { noremap = true, silent = true, desc = "Open the Package Manager UI" }
  )
end)
