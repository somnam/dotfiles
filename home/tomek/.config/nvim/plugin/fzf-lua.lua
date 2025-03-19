local command = require("util.command")
if not command.executable("fzf") then
  return
end

local config = require("core.config")
local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({ source = "ibhagwan/fzf-lua" })

  require("fzf-lua").setup({
    winopts = {
      height = 0.85,
      width = 0.65,
      col = 0.50,
      preview = {
        default = config.get("plugin.fzf_lua.preview"),
        layout = "vertical",
        title = false,
        scrollbar = "float",
        winopts = { number = false },
      },
    },
    fzf_opts = {
      ["--tiebreak"] = "begin",
      ["--history"] = vim.fn.stdpath("data") .. "/fzf_lua_history",
    },
    fzf_colors = true,
    previewers = {
      bat = {
        args = command.bat({ args_only = true, color = true, into_shell = true }),
      },
      builtin = {
        treesitter = { enabled = false },
      },
    },
    defaults = { git_icons = false, file_icons = false },
    files = {
      prompt = "Files❯ ",
      cmd = command.find({ into_shell = true }),
    },
    grep = {
      prompt = "Words❯ ",
      cmd = command.grep({ into_shell = true, color = true }),
      rg_glob = command.executable("rg"),
    },
    manpages = { previewer = "man_native" },
    helptags = { previewer = "help_native" },
    lsp = { code_actions = { previewer = "codeaction_native" } },
  })

  vim.keymap.set(
    "n",
    "<Space><Space>",
    ":FzfLua resume<Enter>",
    { noremap = true, silent = true, desc = "Continue last search" }
  )
  vim.keymap.set(
    "n",
    "<Space>p",
    ":FzfLua oldfiles cwd_only=true<Enter>",
    { noremap = true, silent = true, desc = "List opened local files history" }
  )
  vim.keymap.set(
    "n",
    "<Space>P",
    ":FzfLua oldfiles<Enter>",
    { noremap = true, silent = true, desc = "List opened global files history" }
  )
  vim.keymap.set(
    "n",
    "<Space>f",
    ":FzfLua files<Enter>",
    { noremap = true, silent = true, desc = "Find files on a path" }
  )
  vim.keymap.set(
    "n",
    "<Space>b",
    ":FzfLua buffers<Enter>",
    { noremap = true, silent = true, desc = "List opened buffers" }
  )
  vim.keymap.set(
    "n",
    "<Space>:",
    ":FzfLua command_history<Enter>",
    { noremap = true, silent = true, desc = "List command history" }
  )
  vim.keymap.set(
    "n",
    "<Space>gs",
    ":FzfLua git_status<Enter>",
    { noremap = true, silent = true, desc = "Show working tree status" }
  )
  vim.keymap.set(
    "n",
    "<Space>gl",
    ":FzfLua git_bcommits<Enter>",
    { noremap = true, silent = true, desc = "Show current buffer commit logs" }
  )
  vim.keymap.set(
    "n",
    "<Space>w",
    ":FzfLua live_grep_native<Enter>",
    { noremap = true, silent = true, desc = "Live grep the current project" }
  )
  vim.keymap.set(
    "n",
    "<Space>W",
    ":FzfLua grep_cword<Enter>",
    { noremap = true, silent = true, desc = "Search cursor string in current project" }
  )
  vim.keymap.set(
    "n",
    "<Space>/",
    ":FzfLua lines<Enter>",
    { noremap = true, silent = true, desc = "Search opened buffers lines" }
  )
  vim.keymap.set(
    "n",
    "<Space>d",
    ":FzfLua lsp_document_diagnostics<Enter>",
    { noremap = true, silent = true, desc = "List all buffer diagnostics" }
  )
  vim.keymap.set(
    "n",
    "grs",
    ":FzfLua lsp_document_symbols<Enter>",
    { noremap = true, silent = true, desc = "List all current buffer symbols" }
  )
  vim.keymap.set(
    "n",
    "grr",
    ":FzfLua lsp_references<Enter>",
    { noremap = true, silent = true, desc = "List all symbol references" }
  )
  vim.keymap.set(
    "n",
    "gra",
    ":FzfLua lsp_code_actions<Enter>",
    { noremap = true, silent = true, desc = "Select code action at cursor position" }
  )
end)
