if not require("util.command").executable("node") then
  return
end

local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({
    source = "github/copilot.vim",
    hooks = {
      post_checkout = function()
        vim.cmd("Copilot setup")
      end,
    },
  }, { bang = true })

  local H = {}

  H.lazy_load_copilot = function()
    -- Lazy load copilot server
    if vim.fn.exists("*copilot#RunningClient") == 0 then
      add({ source = "github/copilot.vim" })
      vim.cmd("runtime autoload/copilot.vim | call copilot#Init()")
    end
  end

  H.set_completion_events = function()
    if pcall(require, "cmp") then
      local cmp = require("cmp")
      cmp.event:on("menu_opened", H.maybe_disable_suggestions)
      cmp.event:on("menu_closed", H.maybe_enable_suggestions)
    end
  end

  H.maybe_disable_suggestions = function()
    if #vim.lsp.get_clients({ bufnr = 0, name = "GitHub Copilot" }) > 0 then
      vim.cmd("call copilot#Dismiss()")
      vim.b.copilot_enabled = false
    end
  end

  H.maybe_enable_suggestions = function()
    vim.b.copilot_enabled = nil
  end

  vim.keymap.set("n", "<Space>ce", function()
    H.lazy_load_copilot()
    H.set_completion_events()
  end, { noremap = true, silent = true, desc = "Enable Copilot" })
end)
