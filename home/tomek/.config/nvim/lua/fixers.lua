local available, _ = pcall(require, "formatter")
if not available then return end

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

require("formatter").setup({
    filetype = {
        python = python_fixers,
        -- Use the special "*" filetype for defining formatter configurations on any filetype
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
})

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>lf', ":Format<Enter>", opts)
vim.keymap.set('n', '<leader>lF', ":FormatWrite<Enter>", opts)
