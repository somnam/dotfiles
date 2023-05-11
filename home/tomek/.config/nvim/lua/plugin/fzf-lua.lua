local P = {"ibhagwan/fzf-lua"}

P.config = function()
  local fzf_lua = require("fzf-lua")
  local find = require('util.find')

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
  vim.api.nvim_set_keymap("n", "<Space>p", ":FzfLua oldfiles cwd_only=true<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>P", ":FzfLua oldfiles<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>f", ":FzfLua files<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>b", ":FzfLua buffers<Enter>", opts)
  -- vim
  vim.api.nvim_set_keymap("n", "<Space>:", ":FzfLua command_history<Enter>", opts)
  -- git
  vim.api.nvim_set_keymap("n", "<Space>gs", ":FzfLua git_status<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>gl", ":FzfLua git_bcommits<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>gL", ":FzfLua git_commits<Enter>", opts)
  -- words
  vim.api.nvim_set_keymap("n", "<Space>w", ":FzfLua live_grep<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>W", ":FzfLua live_grep_resume<Enter>", opts)
  -- lsp
  vim.api.nvim_set_keymap("n", "<Space>M", ":FzfLua lsp_document_diagnostics<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>o", ":FzfLua lsp_document_symbols<Enter>", opts)
  vim.api.nvim_set_keymap("n", "<Space>a", ":FzfLua lsp_references<Enter>", opts)

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
      ["bg+"] = {"bg", "Normal"},
    },
    files = {
      prompt = 'Files❯ ',
      cmd = find.find_cmd(),
    },
    grep = {
      prompt = 'Words❯ ',
      cmd = find.grep_cmd(),
      rg_glob = find.has_cmd("rg"),
    },
  })
end

return P
