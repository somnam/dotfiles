if not require("util.command").executable("curl") then
  return
end

local config = require("core.config")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  local enable = config.get("plugin.codecompanion.enable", false)
  local spec = {
    source = "olimorris/codecompanion.nvim",
    checkout = "main",
    depends = { "nvim-lua/plenary.nvim" },
  }

  if not enable then
    add(spec, { bang = true })
    return
  end

  add(spec)

  require("codecompanion").setup({
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = config.get("plugin.codecompanion.model"),
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "copilot",
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
      inline = {
        adapter = "copilot",
      },
      agent = {
        adapter = "copilot",
      },
    },
    display = {
      chat = {
        icons = {
          buffer_pin = "📌 ",
          buffer_watch = "👀 ",
        },
      },
    },
    icons = {
      loading = "🔄 ",
      warning = "⚠️ ",
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
      vim.schedule(function()
        vim.cmd("wincmd =")
      end)
    end,
  })
end)
