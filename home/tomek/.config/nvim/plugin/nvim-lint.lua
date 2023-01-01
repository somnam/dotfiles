local available, lint = pcall(require, "lint")
if not available then return end

local function python_linters()
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

-- Set linters map.
lint.linters_by_ft = {
  python = python_linters()
}

vim.api.nvim_create_autocmd({"BufWinEnter", "BufWritePost"}, {
  group = vim.api.nvim_create_augroup("nvim_lint_trigger", { clear = true }),
  callback = function()
    lint.try_lint()
  end
})
