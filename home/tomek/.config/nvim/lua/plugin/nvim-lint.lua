local command = require("util.command")
local config = require("core.config")
local python = require("util.python")

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local linters = lint.linters

    vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("nvim_lint_trigger", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })

    linters.mypy.args = vim.list_extend(linters.mypy.args, { "--namespace-packages" })

    local H = {}

    H.python_linters = function(names)
      if python.in_virtual_env() then
        return H.python_virtual_env_linters(names)
      else
        return H.linters(names)
      end
    end

    H.python_virtual_env_linters = function(names)
      local results = {}

      for _, name in pairs(names) do
        local linter = linters[name]
        if linter and python.executable_in_virtual_env(linter.cmd) then
          table.insert(results, linter.cmd)
        end
      end

      return results
    end

    H.linters = function(names)
      local results = {}

      for _, name in pairs(names) do
        local linter = linters[name]
        if linter and command.executable(linter.cmd) then
          table.insert(results, linter.cmd)
        end
      end

      return results
    end

    H.linters_by_filetype = function()
      local results = {
        python = H.python_linters(config.plugin.lint.python),
      }

      for filetype, value in pairs(config.plugin.lint) do
        if results[filetype] == nil then
          results[filetype] = H.linters(value)
        end
      end

      return results
    end

    lint.linters_by_ft = H.linters_by_filetype()
  end,
}
