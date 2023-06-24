local P = {"mfussenegger/nvim-lint"}

P.event = {"BufWinEnter", "BufWritePost"}

P.config = function()
  local lint = require("lint")
  local command = require("util.command")

  local H = {}

  H.ruff = lint.linters.ruff.cmd

  H.flake8 = lint.linters.flake8.cmd

  H.mypy = lint.linters.mypy.cmd

  H.luacheck = lint.linters.luacheck.cmd

  H.python_linters = function()
    local linters = {}

    if command.executable_in_virtual_env(H.ruff) then
      table.insert(linters, H.ruff)
    elseif command.executable(H.flake8) then
      table.insert(linters, H.flake8)
    end

    if vim.fn.executable(H.mypy) == 1 then
      table.insert(linters, H.mypy)
      table.insert(lint.linters.mypy.args, "--namespace-packages")
    end

    return linters
  end

  H.lua_linters = function()
    local linters = {}

    if vim.fn.executable(H.luacheck) == 1 then
      table.insert(linters, H.luacheck)
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

return P
