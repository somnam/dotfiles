if not require("util.command").executable("node") then
  return
end

local config = require("core.config")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  local opts = config.get("plugin.copilot.autostart", false) and {} or { bang = true }
  add({
    source = "github/copilot.vim",
    hooks = {
      post_checkout = function()
        vim.cmd("Copilot setup")
      end,
    },
  }, opts)

  local H = {}

  H.lazy_load_copilot = function()
    -- Lazy load copilot server
    if vim.fn.exists("*copilot#RunningClient") == 0 then
      add({ source = "github/copilot.vim" })
      vim.cmd("runtime autoload/copilot.vim | call copilot#Init()")
    end
  end

  vim.keymap.set("n", "<Space>ce", function()
    H.lazy_load_copilot()
  end, { noremap = true, silent = true, desc = "Enable Copilot" })
end)
