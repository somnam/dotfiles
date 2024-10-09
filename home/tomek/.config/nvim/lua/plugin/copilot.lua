local H = {}

H.enable_copilot = function()
  -- Lazy load copilot server
  if vim.fn.exists("*copilot#RunningClient") == 0 then
    require("lazy.core.loader").load("copilot.vim", {}, {})
    vim.cmd("runtime autoload/copilot.vim | call copilot#Init()")
  end
end

H.set_completion_events = function()
  local cmp = require("cmp")
  cmp.event:on("menu_opened", H.maybe_disable_copilot_suggestions)
  cmp.event:on("menu_closed", H.maybe_enable_copilot_suggestions)
end

H.maybe_disable_copilot_suggestions = function()
  if #vim.lsp.get_clients({ bufnr = 0, name = "GitHub Copilot" }) > 0 then
    vim.cmd("call copilot#Dismiss()")
    vim.b.copilot_enabled = false
  end
end

H.maybe_enable_copilot_suggestions = function()
  vim.b.copilot_enabled = nil
end

return {
  "github/copilot.vim",
  build = ":Copilot auth",
  cmd = "Copilot",
  cond = function()
    return require("util.command").executable("node")
  end,
  dependencies = { "hrsh7th/nvim-cmp" },
  keys = {
    {
      "<Space>ce",
      function()
        H.enable_copilot()
        H.set_completion_events()
      end,
      noremap = true,
      silent = true,
      desc = "Enable Copilot",
    },
  },
}
