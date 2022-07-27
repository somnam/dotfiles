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
