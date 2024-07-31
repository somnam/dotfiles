local H = {}

H.enable_copilot = function()
  local copilot_client = require("copilot.client")
  local copilot_command = require("copilot.command")

  if copilot_client.is_disabled() then
    copilot_command.enable()
  end
  copilot_command.attach({ force = true })
end

H.disable_copilot = function()
  local copilot_client = require("copilot.client")
  local copilot_command = require("copilot.command")

  if not copilot_client.is_disabled() then
    copilot_command.detach()
    copilot_command.disable()
  end
end

return {
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    cmd = "Copilot",
    cond = function()
      return require("util.command").executable("node")
    end,
    keys = {
      { "<Space>ce", H.enable_copilot, desc = "Enable Copilot for current buffer." },
      { "<Space>cd", H.disable_copilot, desc = "Disable Copilot for all buffers." },
    },
    opts = {
      suggestion = {
        auto_trigger = false,
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        ["*"] = false,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")

      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end,
  },
}
