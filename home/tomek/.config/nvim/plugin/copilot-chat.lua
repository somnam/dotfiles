if not require("util.command").executable("curl") then
  return
end

local config = require("core.config")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({
    source = "CopilotC-Nvim/CopilotChat.nvim",
    checkout = "main",
    depends = { "nvim-lua/plenary.nvim" },
  })

  require("CopilotChat").setup({
    model = config.get("plugin.copilot_chat.model"),
    mappings = {
      complete = {
        insert = "",
      },
      close = {
        insert = "",
      },
      reset = {
        normal = "<C-e>",
        insert = "<C-e>",
      },
      submit_prompt = {
        normal = "<C-s>",
        insert = "<C-s>",
      },
    },
  })

  vim.keymap.set(
    { "n", "v" },
    "<Space>a",
    ":CopilotChat<Enter>",
    { noremap = true, silent = true, desc = "Open or close the chat window" }
  )

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "copilot-chat",
    group = vim.api.nvim_create_augroup("copilot_chat_open", { clear = true }),
    callback = function()
      vim.schedule(function()
        vim.cmd("wincmd =")
      end)
    end,
  })
end)
