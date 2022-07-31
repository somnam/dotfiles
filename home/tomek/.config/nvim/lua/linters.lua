local available, _ = pcall(require, "lint")
if not available then return end

-- Set python linters list.
local python_linters = {}

local python_flake_cmd = vim.fn.stdpath("data") .. "/python/bin/flake8"
if vim.fn.executable(python_flake_cmd) == 1 then
  table.insert(python_linters, 'flake8')
  require('lint').linters.flake8.cmd = python_flake_cmd
end

local python_mypy_cmd = vim.fn.stdpath("data") .. "/python/bin/mypy"
if vim.fn.executable(python_mypy_cmd) == 1 then
  table.insert(python_linters, 'mypy')
  require('lint').linters.mypy.cmd = python_mypy_cmd
end

-- Set linting.
require('lint').linters_by_ft = {
  python = python_linters
}

-- Trigger linting on file save.
vim.api.nvim_create_autocmd({"BufWinEnter", "BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})
