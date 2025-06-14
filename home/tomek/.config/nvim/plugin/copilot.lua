if not require("util.command").executable("node") then
  return
end

local config = require("core.config")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  local enable = config.get("plugin.copilot.enable", false)
  local spec = {
    source = "github/copilot.vim",
    hooks = {
      post_checkout = function()
        vim.cmd("Copilot setup")
      end,
    },
  }

  if not enable then
    add(spec, { bang = true })
    return
  end

  add(spec)

  vim.g.copilot_workspace_folders = config.get("plugin.copilot.workspace_folders", {})

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
