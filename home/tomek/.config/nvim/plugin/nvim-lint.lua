local available, lint = pcall(require, "lint")
if not available then return end

local python_linters = {}

local vim_data_path = vim.fn.stdpath("data")

local flake8_cmds = {"flake8", vim_data_path .. "/python/bin/flake8"}
for _, flake8_cmd in ipairs(flake8_cmds) do
  if vim.fn.executable(flake8_cmd) == 1 then
    table.insert(python_linters, "flake8")
    lint.linters.flake8.cmd = flake8_cmd
    break
  end
end

local mypy_cmds = {"mypy", vim_data_path .. "/python/bin/mypy"}
for _, mypy_cmd in ipairs(mypy_cmds) do
  if vim.fn.executable(mypy_cmd) == 1 then
    table.insert(python_linters, "mypy")
    lint.linters.mypy.cmd = mypy_cmd
    -- Allow namespace packages.
    table.insert(lint.linters.mypy.args, "--namespace-packages")
    break
  end
end

-- Set linters map.
lint.linters_by_ft = {
  python = python_linters
}

local function nvim_lint_trigger()
  vim.api.nvim_create_autocmd({"BufWinEnter", "BufWritePost"}, {
    group = vim.api.nvim_create_augroup("nvim_lint_trigger", { clear = true }),
    callback = function()
      lint.try_lint()
    end
  })
end

nvim_lint_trigger()
