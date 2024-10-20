local config = require("core.config")
local python = require("util.python")

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<Space>=",
      function()
        require("conform").format({ async = true })
      end,
      noremap = true,
      silent = true,
      desc = "Format current buffer",
    },
  },
  opts = function()
    local H = {}

    --- @return string[]
    H.python_virtual_env_formatters = function(names)
      local results = {}
      local conform = require("conform")

      for _, name in pairs(names) do
        local formatter = conform.get_formatter_config(name)
        if formatter and python.executable_in_virtual_env(formatter.command) then
          table.insert(results, name)
        end
      end

      return results
    end

    --- @return string[]
    H.python_formatters = function(names)
      if python.in_virtual_env() then
        return H.python_virtual_env_formatters(names)
      end
      return names
    end

    H.formatters_by_ft = function()
      return vim.tbl_extend(
        "force",
        config.plugin.conform,
        { python = H.python_formatters(config.plugin.conform.python) }
      )
    end

    return {
      formatters = {
        trim_whitespace = {
          condition = function(_, ctx)
            return vim.bo[ctx.buf].modifiable
          end,
        },
      },
      formatters_by_ft = H.formatters_by_ft(),
      format_on_save = { timeout_ms = 500 },
    }
  end,
}
