local command = require("util.command")
if not command.executable("fzf") then
  return
end

local config = require("core.config")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({ source = "ibhagwan/fzf-lua" })

  local overrides = config.get("plugin.fzf_lua.overrides", {})

  require("fzf-lua").setup(vim.tbl_deep_extend("keep", overrides, {
    winopts = {
      height = 0.85,
      width = 0.65,
      col = 0.50,
      preview = { layout = "vertical", winopts = { number = false } },
      treesitter = { enabled = false },
    },
    fzf_opts = {
      ["--tiebreak"] = "begin",
      ["--history"] = vim.fn.stdpath("data") .. "/fzf_lua_history",
    },
    previewers = {
      builtin = { treesitter = { enabled = false } },
    },
    defaults = { git_icons = false, file_icons = false },
    files = {
      cmd = command.find({ into_shell = true }),
    },
    grep = {
      cmd = command.grep({ into_shell = true, color = true }),
      rg_glob = command.executable("rg"),
    },
    manpages = { previewer = "man_native" },
    helptags = { previewer = "help_native" },
    lsp = { code_actions = { previewer = "codeaction_native" } },
  }))

  vim.keymap.set(
    "n",
    "<leader><leader>",
    ":FzfLua resume<Enter>",
    { noremap = true, silent = true, desc = "Continue last search" }
  )
  vim.keymap.set(
    "n",
    "<leader>p",
    ":FzfLua oldfiles cwd_only=true<Enter>",
    { noremap = true, silent = true, desc = "List opened local files history" }
  )
  vim.keymap.set(
    "n",
    "<leader>P",
    ":FzfLua oldfiles<Enter>",
    { noremap = true, silent = true, desc = "List opened global files history" }
  )
  vim.keymap.set(
    "n",
    "<leader>f",
    ":FzfLua files<Enter>",
    { noremap = true, silent = true, desc = "Find files on a path" }
  )
  vim.keymap.set(
    "n",
    "<leader>b",
    ":FzfLua buffers<Enter>",
    { noremap = true, silent = true, desc = "List opened buffers" }
  )
  vim.keymap.set(
    "n",
    "<leader>:",
    ":FzfLua command_history<Enter>",
    { noremap = true, silent = true, desc = "List command history" }
  )
  vim.keymap.set(
    "n",
    "<leader>gs",
    ":FzfLua git_status<Enter>",
    { noremap = true, silent = true, desc = "Show working tree status" }
  )
  vim.keymap.set(
    "n",
    "<leader>gl",
    ":FzfLua git_bcommits<Enter>",
    { noremap = true, silent = true, desc = "Show current buffer commit logs" }
  )
  vim.keymap.set(
    "n",
    "<leader>w",
    ":FzfLua live_grep_native<Enter>",
    { noremap = true, silent = true, desc = "Live grep the current project" }
  )
  vim.keymap.set(
    "n",
    "<leader>W",
    ":FzfLua grep_cword<Enter>",
    { noremap = true, silent = true, desc = "Search cursor string in current project" }
  )
  vim.keymap.set(
    "n",
    "<leader>/",
    ":FzfLua lines<Enter>",
    { noremap = true, silent = true, desc = "Search opened buffers lines" }
  )
  vim.keymap.set(
    "n",
    "<leader>d",
    ":FzfLua lsp_document_diagnostics<Enter>",
    { noremap = true, silent = true, desc = "List all buffer diagnostics" }
  )
  vim.keymap.set(
    "n",
    "grr",
    ":FzfLua lsp_references<Enter>",
    { noremap = true, silent = true, desc = "List all symbol references" }
  )
  vim.keymap.set(
    "n",
    "gri",
    ":FzfLua lsp_implementations<Enter>",
    { noremap = true, silent = true, desc = "List all symbol implementations" }
  )
  vim.keymap.set(
    "n",
    "gra",
    ":FzfLua lsp_code_actions<Enter>",
    { noremap = true, silent = true, desc = "Select code action at cursor position" }
  )
end)
