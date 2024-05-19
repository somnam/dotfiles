local command = require("util.command")
local search = require("util.search")

return {
  "ibhagwan/fzf-lua",
  event = "VimEnter",
  cond = function()
    return require("util.command").executable("fzf")
  end,
  keys = {
    {
      "<Space>p",
      ":FzfLua oldfiles cwd_only=true<Enter>",
      noremap = true,
      silent = true,
      desc = "List opened local files history",
    },
    {
      "<Space>P",
      ":FzfLua oldfiles<Enter>",
      noremap = true,
      silent = true,
      desc = "List opened global files history",
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
      "<Space>gL",
      ":FzfLua git_commits<Enter>",
      noremap = true,
      silent = true,
      desc = "Show working tree commit logs",
    },
    {
      "<Space>w",
      ":FzfLua live_grep_native<Enter>",
      noremap = true,
      silent = true,
      desc = "Live grep the current project",
    },
    {
      "<Space>W",
      ":FzfLua live_grep_resume<Enter>",
      noremap = true,
      silent = true,
      desc = "Live grep continue last search",
    },
    {
      "<Space>l",
      ":FzfLua lines<Enter>",
      noremap = true,
      silent = true,
      desc = "Search opened buffers lines",
    },
    {
      "<Space>M",
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
      width = 0.65,
      row = 0.1,
      col = 0.5,
      preview = {
        layout = "vertical",
        winopts = {
          number = false,
        },
      },
    },
    fzf_opts = {
      ["--history"] = vim.fn.stdpath("data") .. "/fzf_lua_history",
    },
    fzf_colors = {
      ["fg"] = { "fg", "Normal" },
      ["bg"] = { "bg", "Normal" },
      ["hl"] = { "fg", "Comment" },
      ["fg+"] = { "fg", "Normal" },
      ["bg+"] = { "bg", "CursorLine" },
      ["hl+"] = { "fg", "Statement" },
      ["info"] = { "fg", "PreProc" },
      ["prompt"] = { "fg", "Conditional" },
      ["pointer"] = { "fg", "Exception" },
      ["marker"] = { "fg", "Keyword" },
      ["spinner"] = { "fg", "Label" },
      ["header"] = { "fg", "Comment" },
      ["gutter"] = { "bg", "Normal" },
    },
    files = {
      prompt = "Files❯ ",
      cmd = search.find(),
    },
    grep = {
      prompt = "Words❯ ",
      cmd = search.grep(),
      rg_glob = command.executable("rg"),
    },
  },
}
