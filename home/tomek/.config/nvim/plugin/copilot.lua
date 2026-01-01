if vim.fn.executable("node") ~= 1 then
  vim.notify("node not installed; copilot plugin skipped.", vim.log.levels.WARN)
  return
end

local buffer = require("util.buffer")
local config = require("util.config")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  local enable = config.get("plugin.copilot.enable")
  local spec = {
    source = "github/copilot.vim",
    hooks = {
      post_install = function() vim.cmd("Copilot setup") end,
      post_checkout = function() vim.cmd("Copilot setup") end,
    },
  }

  if not enable then
    add(spec, { bang = true })
    return
  end

  add(spec)

  local copilot_filetypes = {}
  for _, filetype in ipairs(buffer.exclude_filetype) do
    copilot_filetypes[filetype] = false
  end
  vim.g.copilot_filetypes = copilot_filetypes

  vim.g.copilot_workspace_folders = config.get("plugin.copilot.workspace_folders", {})
  vim.g.copilot_idle_delay = config.get("plugin.copilot.idle_delay", 150)
end)
