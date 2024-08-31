local command = require("util.command")

return {
  "ibhagwan/fzf-lua",
  event = "VimEnter",
  cond = function()
    return require("util.command").executable("fzf")
  end,
  keys = {
    {
      "<Space><Space>",
      ":FzfLua resume<Enter>",
      noremap = true,
      silent = true,
      desc = "List opened local files history",
    },
    {
      "<Space>p",
      ":FzfLua oldfiles<Enter>",
      noremap = true,
      silent = true,
      desc = "List opened files history",
    },
    {
      "<Space>f",
      ":FzfLua files<Enter>",
      noremap = true,
      silent = true,
      desc = "Find files on a path",
    },
    {
      "<Space>b",
      ":FzfLua buffers<Enter>",
      noremap = true,
      silent = true,
      desc = "List opened buffers",
    },
    {
      "<Space>:",
      ":FzfLua command_history<Enter>",
      noremap = true,
      silent = true,
      desc = "List command history",
    },
    {
      "<Space>gs",
      ":FzfLua git_status<Enter>",
      noremap = true,
      silent = true,
      desc = "Show working tree status",
    },
    {
      "<Space>gl",
      ":FzfLua git_bcommits<Enter>",
      noremap = true,
      silent = true,
      desc = "Show current buffer commit logs",
    },
    {
      "<Space>w",
      ":FzfLua live_grep_native<Enter>",
      noremap = true,
      silent = true,
      desc = "Live grep the current project",
    },
    {
      "<Space>s",
      ":FzfLua grep_cword<Enter>",
      noremap = true,
      silent = true,
      desc = "Search cursor string in current project",
    },
    {
      "<Space>/",
      ":FzfLua lines<Enter>",
      noremap = true,
      silent = true,
      desc = "Search opened buffers lines",
    },
    {
      "<Space>d",
      ":FzfLua lsp_document_diagnostics<Enter>",
      noremap = true,
      silent = true,
      desc = "List all buffer diagnostics",
    },
    {
      "<Space>o",
      ":FzfLua lsp_document_symbols<Enter>",
      noremap = true,
      silent = true,
      desc = "List all buffer symbols",
    },
    {
      "<Space>a",
      ":FzfLua lsp_references<Enter>",
      noremap = true,
      silent = true,
      desc = "List all symbol references",
    },
  },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.65,
      col = 0.50,
      backdrop = 100,
      border = "none",
      preview = {
        default = command.bat({ cmd_only = true }),
        layout = "vertical",
        winopts = { number = false },
      },
    },
    fzf_opts = {
      ["--border"] = "rounded",
      ["--history"] = vim.fn.stdpath("data") .. "/fzf_lua_history",
    },
    fzf_colors = true,
    previewers = {
      bat = {
        args = command.bat({ args_only = true, color = true, into_shell = true }),
      },
      builtin = {
        syntax = false,
        treesitter = { enable = false },
      },
    },
    defaults = {
      git_icons = false,
      file_icons = false,
    },
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
  },
}
