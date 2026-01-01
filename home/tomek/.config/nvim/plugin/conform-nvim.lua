local buffer = require("util.buffer")
local config = require("util.config")
local tool = require("util.tool")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({ source = "stevearc/conform.nvim" })

  ---@return { [string]: string[] }
  local function formatters_by_ft() return config.get("plugin.conform", {}) end

  local function commands_by_ft()
    local conform = require("conform")

    local result = {}
    for filetype, formatters in pairs(formatters_by_ft()) do
      result[filetype] = {}
      for _, formatter in ipairs(formatters) do
        local formatter_info = conform.get_formatter_info(formatter)
        if
          formatter_info.available
          and not vim.tbl_contains(result[filetype], formatter_info.command)
        then
          table.insert(result[filetype], formatter_info.command)
        end
      end
    end
    return result
  end

  tool.set_formatters_by_ft(commands_by_ft())

  local conform = require("conform")
  conform.setup({
    formatters = {
      trim_whitespace = {
        condition = function(_, ctx)
          return vim.bo[ctx.buf].modifiable and not buffer.above_max_size(ctx.buf)
        end,
      },
    },
    formatters_by_ft = formatters_by_ft(),
    format_on_save = { timeout_ms = 500 },
  })

  vim.keymap.set(
    "n",
    "<leader>=",
    function() conform.format({ async = true }) end,
    { noremap = true, silent = true, desc = "Format current buffer" }
  )
end)
