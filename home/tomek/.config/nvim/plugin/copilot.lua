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

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("maybe_disable_github_copilot", { clear = true }),
    callback = function(ctx)
      if buffer.excluded(ctx.buf) then
        vim.b.copilot_enabled = false
      end
    end,
  })

  vim.g.copilot_workspace_folders = config.get("plugin.copilot.workspace_folders", {})
end)
