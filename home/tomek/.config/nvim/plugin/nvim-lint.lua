local config = require("util.config")
local misc = require("util.misc")
local python = require("util.python")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({ source = "mfussenegger/nvim-lint" })

  local lint = require("lint")
  local linters = lint.linters

  local H = {}

  H.linters = function(names)
    local results = {}

    for _, name in pairs(names) do
      local linter = linters[name]
      if linter and misc.executable(linter.cmd) then
        table.insert(results, linter.cmd)
      end
    end

    return results
  end

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

  H.linters_by_filetype = function()
    local results = {
      python = H.python_linters(config.get("plugin.lint.python", {})),
    }

    for filetype, value in pairs(config.get("plugin.lint", {})) do
      if results[filetype] == nil then
        results[filetype] = H.linters(value)
      end
    end

    return results
  end

  linters.mypy.args = vim.list_extend(linters.mypy.args, { "--namespace-packages" })

  lint.linters_by_ft = H.linters_by_filetype()

  vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
    group = vim.api.nvim_create_augroup("nvim_lint_trigger", { clear = true }),
    callback = function()
      lint.try_lint()
    end,
  })
end)
