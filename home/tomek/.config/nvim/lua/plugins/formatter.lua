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

local vim_data_path = vim.fn.stdpath("data")

local isort_cmds = {"isort", vim_data_path .. "/python/bin/isort"}
for _, isort_cmd in ipairs(isort_cmds) do
    if vim.fn.executable(isort_cmd) == 1 then
        local isort = require("formatter.filetypes.python").isort()
        isort.exe = isort_cmd
        table.insert(python_fixers, function() return isort end)
        break
    end
end

local black_cmds = {"black", vim_data_path .. "/python/bin/black"}
for _, black_cmd in ipairs(black_cmds) do
    if vim.fn.executable(black_cmd) == 1 then
        local black = require("formatter.filetypes.python").black()
        black.exe = black_cmd
        table.insert(python_fixers, function() return black end)
        break
    end
end

formatter.setup({
    filetype = {
        python = python_fixers,
        -- Use the special "*" filetype for defining formatter configurations on any filetype
        ["*"] = {remove_trailing_whitespace}
    }
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>df", ":Format<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>dF", ":FormatWrite<Enter>", opts)
