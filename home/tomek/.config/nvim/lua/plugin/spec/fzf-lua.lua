return {
  "ibhagwan/fzf-lua",
  event = "VimEnter",
  config = function()
    local fzf_lua = require("fzf-lua")
    local search = require('util.search')
    local command = require("util.command")

    -- autocmd
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("set_fzf_lua_hl", { clear = true }),
      callback = function()
        vim.api.nvim_set_hl(0, "FzfLuaNormal", {nocombine = true})
        vim.api.nvim_set_hl(0, "FzfLuaBorder", {nocombine = true})
      end
    })

    --keymap
    local opts = {noremap = true, silent = true}
    -- files
    vim.api.nvim_set_keymap(
      "n", "<Space>p", ":FzfLua oldfiles cwd_only=true<Enter>",
      vim.tbl_extend("keep", {desc = "List opened local files history"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>P", ":FzfLua oldfiles<Enter>",
      vim.tbl_extend("keep", {desc = "List opened global files history"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>f", ":FzfLua files<Enter>",
      vim.tbl_extend("keep", {desc = "Find files on a path"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>b", ":FzfLua buffers<Enter>",
      vim.tbl_extend("keep", {desc = "List opened buffers"}, opts)
    )
    -- vim
    vim.api.nvim_set_keymap(
      "n", "<Space>:", ":FzfLua command_history<Enter>",
      vim.tbl_extend("keep", {desc = "List command history"}, opts)
    )
    -- git
    vim.api.nvim_set_keymap(
      "n", "<Space>gs", ":FzfLua git_status<Enter>",
      vim.tbl_extend("keep", {desc = "Show working tree status"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>gl", ":FzfLua git_bcommits<Enter>",
      vim.tbl_extend("keep", {desc = "Show current buffer commit logs"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>gL", ":FzfLua git_commits<Enter>",
      vim.tbl_extend("keep", {desc = "Show working tree commit logs"}, opts)
    )
    -- words
    vim.api.nvim_set_keymap(
      "n", "<Space>w", ":FzfLua live_grep<Enter>",
      vim.tbl_extend("keep", {desc = "Live grep the current project"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>W", ":FzfLua live_grep_resume<Enter>",
      vim.tbl_extend("keep", {desc = "Live grep continue last search"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>l", ":FzfLua lines<Enter>",
      vim.tbl_extend("keep", {desc = "Search opened buffers lines"}, opts)
    )
    -- lsp
    vim.api.nvim_set_keymap(
      "n", "<Space>M", ":FzfLua lsp_document_diagnostics<Enter>",
      vim.tbl_extend("keep", {desc = "List all buffer diagnostics"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>o", ":FzfLua lsp_document_symbols<Enter>",
      vim.tbl_extend("keep", {desc = "List all buffer symbols"}, opts)
    )
    vim.api.nvim_set_keymap(
      "n", "<Space>a", ":FzfLua lsp_references<Enter>",
      vim.tbl_extend("keep", {desc = "List all symbol references"}, opts)
    )

    -- setup
    fzf_lua.setup({
      winopts = {
        width = 0.65,
        col = 0.50,
        preview = {layout = "vertical"},
      },
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf_lua_history",
      },
      fzf_colors = {
        ["fg"] = {"fg", "Normal"},
        ["bg"] = {"bg", "Normal"},
        ["hl"] = {"fg", "Comment"},
        ["fg+"] = {"fg", "Normal"},
        ["bg+"] = {"bg", "CursorLine"},
        ["hl+"] = {"fg", "Statement"},
        ["info"] = {"fg", "PreProc"},
        ["prompt"] = {"fg", "Conditional"},
        ["pointer"] = {"fg", "Exception"},
        ["marker"] = {"fg", "Keyword"},
        ["spinner"] = {"fg", "Label"},
        ["header"] = {"fg", "Comment"},
        ["gutter"] = {"bg", "Normal"},
      },
      files = {
        prompt = 'Files❯ ',
        cmd = search.find(),
      },
      grep = {
        prompt = 'Words❯ ',
        cmd = search.grep(),
        rg_glob = command.executable("rg")
      },
    })
  end
}
