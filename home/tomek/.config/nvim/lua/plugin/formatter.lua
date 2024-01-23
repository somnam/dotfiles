local config = require("core.config")
local command = require("util.command")
local python = require("util.python")

return {
  "mhartington/formatter.nvim",
  event = {"BufReadPost", "BufNewFile"},
  keys = {
    {
      "<Space>=",
      ":FormatWrite<Enter>",
      noremap = true,
      silent = true,
      desc = "Format and write current buffer"
    },
  },
  opts = function()
    local filetypes = require("formatter.filetypes")
    local defaults = require("formatter.defaults")
    local util = require("formatter.util")

    defaults.perl_pie = function(pattern, replacement, flags)
      return {
        exe = "perl",
        args = {
          "-p -i -e",
          util.quote_cmd_arg(util.wrap_sed_replace(pattern, replacement, flags)),
        },
        stdin = false,
      }
    end

    -- Use perl insead of sed for whitespace replacement.
    filetypes.any.strip_trailing_whitespace = util.withl(defaults.perl_pie, "[ \t]*$")

    filetypes.python.ruff_check = function()
      return {
        exe = "ruff",
        args = { "check", "--quiet", "--fix", "--exit-zero", "-" },
        stdin = true,
      }
    end

    local H = {}

    H.formatters = function(names)
      local results = {}

      for _, name in pairs(names) do
        local formatter = filetypes.rust[name]
        if formatter and command.executable(formatter().exe) then
          table.insert(results, formatter)
        end
      end

      return results
    end

    H.python_formatters = function(names)
      if python.in_virtual_env() then
        return H.python_virtual_env_formatters(names)
      else
        return H.formatters(names)
      end
    end

    H.python_virtual_env_formatters = function(names)
      local results = {}

      for _, name in pairs(names) do
        local formatter = filetypes.python[name]
        if formatter and python.executable_in_virtual_env(formatter().exe) then
          table.insert(results, formatter)
        end
      end

      return results
    end

    H.formatters_by_filetype = function()
      local results = {
        python = H.python_formatters(config.plugin.formatter.python),
        -- Formatter configurations on any filetype
        ["*"] = {filetypes.any.strip_trailing_whitespace}
      }

      for filetype, value in pairs(config.plugin.formatter) do
        if results[filetype] == nil then
          results[filetype] = H.formatters(value)
        end
      end

      return results
    end

    return {
      filetype = H.formatters_by_filetype(),
    }
  end
}
