local available, formatter = pcall(require, "formatter")
if not available then return end

local util = require("formatter.util")

-- Use perl insead of sed for character replacement.
local function perl(pattern, replacement, flags)
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

local function python_fixers()
    local fixers = {}

    local isort = require("formatter.filetypes.python").isort
    if vim.fn.executable(isort().exe) == 1 then
        table.insert(fixers, isort)
    end

    local black = require("formatter.filetypes.python").black
    if vim.fn.executable(black().exe) == 1 then
        table.insert(fixers, black)
    end

    return fixers
end

formatter.setup({
    filetype = {
        python = python_fixers(),
        -- Use the special "*" filetype for defining formatter configurations on any filetype
        ["*"] = {remove_trailing_whitespace}
    }
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>=", ":FormatWrite<Enter>", opts)
