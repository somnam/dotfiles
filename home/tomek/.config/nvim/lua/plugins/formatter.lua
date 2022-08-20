local available, formatter = pcall(require, "formatter")
if not available then return end

local util = require("formatter.util")

-- Use perl insead of sed for character replacement.
local perl = function(pattern, replacement, flags)
  return {
    exe = "perl",
    args = {
      "-p -i -e",
      util.quote_cmd_arg(util.wrap_sed_replace(pattern, replacement, flags)),
    },
    stdin = false,
  }
end

local remove_trailing_whitespace = util.withl(perl, "[ \t]*$")

-- Set python fixers list.
local python_fixers = {}

local python_isort_cmd = vim.fn.stdpath("data") .. "/python/bin/isort"
if vim.fn.executable(python_isort_cmd) == 1 then
    local isort = require("formatter.filetypes.python").isort()
    isort.exe = python_isort_cmd
    table.insert(python_fixers, function() return isort end)
end

local python_black_cmd = vim.fn.stdpath("data") .. "/python/bin/black"
if vim.fn.executable(python_black_cmd) == 1 then
    local black = require("formatter.filetypes.python").black()
    black.exe = python_black_cmd
    table.insert(python_fixers, function() return black end)
end

formatter.setup({
    filetype = {
        python = python_fixers,
        -- Use the special "*" filetype for defining formatter configurations on any filetype
        ["*"] = {remove_trailing_whitespace}
    }
})

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<Space>lf', ":Format<Enter>", opts)
vim.keymap.set('n', '<Space>lF', ":FormatWrite<Enter>", opts)
