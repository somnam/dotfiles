return {
  "mfussenegger/nvim-lint",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local lint = require("lint")
    local command = require("util.command")
    local python = require("util.python")

    local H = {}

    H.ruff = lint.linters.ruff

    H.flake8 = lint.linters.flake8

    H.mypy = lint.linters.mypy
    H.mypy.args = vim.list_extend(lint.linters.mypy.args, {"--namespace-packages"})

    H.luacheck = lint.linters.luacheck

    H.python_linters = function()
      local linters = {}

      if python.executable_in_virtual_env(H.ruff.cmd) then
        table.insert(linters, H.ruff.cmd)
      elseif command.executable(H.flake8.cmd) then
        table.insert(linters, H.flake8.cmd)
      end

      if command.executable(H.mypy.cmd) then
        table.insert(linters, H.mypy.cmd)
      end

      return linters
    end

    H.lua_linters = function()
      local linters = {}

      if command.executable(H.luacheck.cmd) then
        table.insert(linters, H.luacheck.cmd)
      end

      return linters
    end

    H.linters_by_ft = function()
      return {
        python = H.python_linters(),
        lua = H.lua_linters(),
      }
    end

    -- autocmd
    vim.api.nvim_create_autocmd({"BufWinEnter", "BufWritePost"}, {
      group = vim.api.nvim_create_augroup("nvim_lint_trigger", { clear = true }),
      callback = function()
        lint.try_lint()
      end
    })

    -- setup
    lint.linters_by_ft = H.linters_by_ft()
  end
}
