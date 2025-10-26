if not require("util.misc").executable("node") then
  return
end

local buffer = require("util.buffer")
local config = require("util.config")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  local enable = config.get("plugin.copilot.enable", false)
  local spec = {
    source = "github/copilot.vim",
    hooks = {
      post_install = function()
        vim.cmd("Copilot setup")
      end,
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

  local copilot_filetypes = {}
  for _, filetype in ipairs(buffer.exclude_filetype) do
    copilot_filetypes[filetype] = false
  end
  vim.g.copilot_filetypes = copilot_filetypes

  vim.g.copilot_workspace_folders = config.get("plugin.copilot.workspace_folders", {})
end)
