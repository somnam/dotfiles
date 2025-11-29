local buffer = require("util.buffer")
local config = require("util.config")
local tool = require("util.tool")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({ source = "stevearc/conform.nvim" })

  local H = {}

  ---@return { [string]: string[] }
  H.formatters_by_ft = function()
    return config.get("plugin.conform", {})
  end

  H.commands_by_ft = function()
    local conform = require("conform")

    local commands_by_ft = {}
    for filetype, formatters in pairs(H.formatters_by_ft()) do
      commands_by_ft[filetype] = {}
      for _, formatter in ipairs(formatters) do
        local formatter_info = conform.get_formatter_info(formatter)
        if
          formatter_info.available
          and not vim.tbl_contains(commands_by_ft[filetype], formatter_info.command)
        then
          table.insert(commands_by_ft[filetype], formatter_info.command)
        end
      end
    end
    return commands_by_ft
  end

  tool.set_formatters_by_ft(H.commands_by_ft())

  local conform = require("conform")
  conform.setup({
    formatters = {
      trim_whitespace = {
        condition = function(_, ctx)
          return vim.bo[ctx.buf].modifiable and not buffer.above_max_size(ctx.buf)
        end,
      },
    },
    formatters_by_ft = H.formatters_by_ft(),
    format_on_save = { timeout_ms = 500 },
  })

  vim.keymap.set("n", "<leader>=", function()
    conform.format({ async = true })
  end, { noremap = true, silent = true, desc = "Format current buffer" })
end)
