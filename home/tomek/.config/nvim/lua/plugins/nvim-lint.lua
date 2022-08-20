local available, lint = pcall(require, "lint")
if not available then return end

local function extend_mypy_path(additional_paths)
  local mypy_paths = {}

  -- Existing paths.
  for path in string.gmatch((vim.env.MYPYPATH or ""), "[^:,]+") do
    table.insert(mypy_paths, path)
  end

  -- Additional paths.
  for idx = 1, #additional_paths do
    table.insert(mypy_paths, additional_paths[idx])
  end

  return table.concat(mypy_paths, ":")
end

-- Python linters list.
local python_linters = {}

local python_flake_cmd = vim.fn.stdpath("data") .. "/python/bin/flake8"
if vim.fn.executable(python_flake_cmd) == 1 then
  table.insert(python_linters, 'flake8')
  lint.linters.flake8.cmd = python_flake_cmd
end

local python_mypy_cmd = vim.fn.stdpath("data") .. "/python/bin/mypy"
if vim.fn.executable(python_mypy_cmd) == 1 then
  table.insert(python_linters, 'mypy')
  lint.linters.mypy.cmd = python_mypy_cmd

  table.insert(
    lint.linters.mypy.args,
    -- Allow namespace packages.
    "--namespace-packages"
  )

  local mypy_path = extend_mypy_path({
    -- Additional entries in MYPYPATH.
    -- vim.fn.expand("~/additional/path"),
  })

  lint.linters.mypy.env = {
    ["MYPYPATH"] = mypy_path,
  }
end

-- Set linting map.
lint.linters_by_ft = {
  python = python_linters
}

-- Trigger linting on file save.
vim.api.nvim_create_autocmd({"BufWinEnter", "BufWritePost"}, {
  callback = function()
    lint.try_lint()
  end,
})
