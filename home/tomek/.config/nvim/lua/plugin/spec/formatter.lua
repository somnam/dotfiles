local P = {"mhartington/formatter.nvim"}

P.event = {"BufReadPost", "BufNewFile"}

P.config = function()
  local formatter = require("formatter")
  local util = require("formatter.util")
  local command = require("util.command")
  local python = require("util.python")

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

  H.isort = require("formatter.filetypes.python").isort

  H.black = require("formatter.filetypes.python").black

  H.autoflake = function()
    return {
      exe = "autoflake",
      args = {"--in-place"},
    }
  end

  H.ruff = function()
    return {
      exe = "ruff",
      args = {"--fix"},
    }
  end

  H.rustfmt = require("formatter.filetypes.rust").rustfmt

  H.python_fixers = function()
    if python.executable_in_virtual_env(H.ruff().exe) then
      return {H.ruff}
    end

    local fixers = {}

    if command.executable(H.isort().exe) then
        table.insert(fixers, H.isort)
    end

    if command.executable(H.black().exe) then
        table.insert(fixers, H.black)
    end

    if command.executable(H.autoflake().exe) then
        table.insert(fixers, H.autoflake)
    end

    return fixers
  end

  H.rust_fixers = function()
    local fixers = {}

    if command.executable(H.rustfmt().exe) then
      table.insert(fixers, H.rustfmt)
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
      rust = H.rust_fixers(),
      -- Formatter configurations on any filetype
      ["*"] = {H.remove_trailing_whitespace}
    }
  })
end

return P
