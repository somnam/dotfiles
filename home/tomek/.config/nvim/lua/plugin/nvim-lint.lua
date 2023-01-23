local P = {"mfussenegger/nvim-lint"}

P.config = function()
  local lint = require("lint")

  local H = {}

  H.python_linters = function()
    local linters = {}

    local flake8 = lint.linters.flake8
    if vim.fn.executable(flake8.cmd) == 1 then
      table.insert(linters, flake8.cmd)
    end

    local mypy = lint.linters.mypy
    if vim.fn.executable(mypy.cmd) == 1 then
      table.insert(linters, mypy.cmd)
      table.insert(lint.linters.mypy.args, "--namespace-packages")
    end

    return linters
  end

  H.lua_linters = function()
    local linters = {}

    local luacheck = lint.linters.luacheck
    if vim.fn.executable(luacheck.cmd) == 1 then
      table.insert(linters, luacheck.cmd)
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
