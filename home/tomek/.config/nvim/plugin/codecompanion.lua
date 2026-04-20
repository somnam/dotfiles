if vim.fn.executable("curl") ~= 1 then
  vim.notify("curl not installed; codecompanion plugin skipped.", vim.log.levels.WARN)
  return
end

local config = require("util.config")

Config.later(function()
  vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/olimorris/codecompanion.nvim",
  })

  if not config.get("plugin.codecompanion.enable") then
    return
  end

  local adapters = require("codecompanion.adapters")

  require("codecompanion").setup({
    adapters = {
      http = {
        copilot = function()
          return adapters.extend("copilot", {
            schema = {
              model = {
                default = config.get(
                  "plugin.codecompanion.model",
                  vim.tbl_get(adapters.extend("copilot"), "schema", "model", "default")
                ),
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        keymaps = {
          send = {
            modes = {
              n = "<C-s>",
              i = "<C-s>",
            },
          },
          close = {
            modes = {
              n = "<A-x>",
              i = "<A-x>",
            },
          },
        },
      },
    },
    display = {
      chat = {
        icons = {
          buffer_sync_all = "↻ ",
          buffer_sync_diff = "± ",
          chat_context = "… ",
          chat_fold = "▸ ",
          tool_pending = "○ ",
          tool_in_progress = "⟳ ",
          tool_failure = "✖ ",
          tool_success = "✔ ",
        },
      },
    },
    icons = {
      warning = "⚠ ",
    },
  })

  vim.keymap.set(
    { "n", "v" },
    "<leader>a",
    ":CodeCompanionActions<Enter>",
    { noremap = true, silent = true, desc = "Open the action palette" }
  )

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "codecompanion",
    group = vim.api.nvim_create_augroup("codecompanion_chat_open", { clear = true }),
    callback = function()
      vim.schedule(function() vim.cmd("wincmd =") end)
    end,
  })
end)
