local config = require("util.config")
local tool = require("util.tool")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({ source = "mfussenegger/nvim-lint" })

  local H = {}

  H.linters_by_ft = function()
    local lint = require("lint")

    local linters_by_ft = {}
    for filetype, names in pairs(config.get("plugin.lint", {})) do
      local linters = {}
      for _, name in pairs(names) do
        local linter = lint.linters[name]
        if linter and vim.fn.executable(linter.cmd) == 1 then
          table.insert(linters, name)
        end
      end
      linters_by_ft[filetype] = linters
    end

    return linters_by_ft
  end

  tool.set_linters_by_ft(H.linters_by_ft())

  local lint = require("lint")

  lint.linters.mypy.args = vim.list_extend(lint.linters.mypy.args, { "--namespace-packages" })

  lint.linters_by_ft = H.linters_by_ft()

  vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
    group = vim.api.nvim_create_augroup("nvim_lint_trigger", { clear = true }),
    callback = function()
      lint.try_lint()
    end,
  })
end)
