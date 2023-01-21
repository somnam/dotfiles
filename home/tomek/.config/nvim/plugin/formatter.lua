local available, formatter = pcall(require, "formatter")
if not available then return end

local util = require("formatter.util")

-- helper
local H = {}

H.perl = function(pattern, replacement, flags)
  -- Use perl insead of sed for character replacement.
  return {
    exe = "perl",
    args = {
      "-p -i -e",
      util.quote_cmd_arg(util.wrap_sed_replace(pattern, replacement, flags)),
    },
    stdin = false,
  }
end

H.remove_trailing_whitespace = util.withl(H.perl, "[ \t]*$")

H.autoflake = function()
  return {
    exe = "autoflake",
    args = {"--in-place"},
  }
end

H.python_fixers = function()
  local fixers = {}

  local isort = require("formatter.filetypes.python").isort
  if vim.fn.executable(isort().exe) == 1 then
      table.insert(fixers, isort)
  end

  local black = require("formatter.filetypes.python").black
  if vim.fn.executable(black().exe) == 1 then
      table.insert(fixers, black)
  end

  if vim.fn.executable(H.autoflake().exe) == 1 then
      table.insert(fixers, H.autoflake)
  end

  return fixers
end

-- keymap
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>=", ":FormatWrite<Enter>", opts)

-- setup
formatter.setup({
  filetype = {
    python = H.python_fixers(),
    -- Formatter configurations on any filetype
    ["*"] = {H.remove_trailing_whitespace}
  }
})
