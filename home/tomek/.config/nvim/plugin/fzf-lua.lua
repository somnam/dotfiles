local available, fzf_lua = pcall(require, "fzf-lua")
if not available then return end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="*",
  group = vim.api.nvim_create_augroup("set_fzf_lua_hl", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, 'FzfLuaNormal', {nocombine = true})
    vim.api.nvim_set_hl(0, "FzfLuaBorder", {nocombine = true})
  end
})

local find_cmd = {
  "find",
  "-L",
  ".",
  "-type f",
  "-not",
  "-path",
  "'*/.*'",
}

local grep_cmd = {
  "grep",
  "--binary-files=without-match",
  "--line-number",
  "--recursive",
  "--color=auto",
  "--perl-regexp",
  "--exclude-dir='.*'",
}
if vim.fn.executable("ack") == 1 then
  grep_cmd = {
    "ack",
    "--nocolor",
    "--column",
    "--smart-case",
    "--ignore-dir={.cache,.mypy_cache,.pytest_cache}",
    "--ignore-dir={.env,.venv}",
  }
end

local vim_data_path = vim.fn.stdpath("data")

fzf_lua.setup({
  winopts = {
    width = 0.65,
    col = 0.50,
    preview = {layout = "vertical"},
  },
  fzf_opts = {
    ["--history"] = vim_data_path .. "/fzf_lua_history",
  },
  fzf_colors = {
    ["bg+"] = {"bg", "Normal"},
  },
  files = {cmd = table.concat(find_cmd, " ")},
  grep = {cmd = table.concat(grep_cmd, " ")},
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>p", ":FzfLua oldfiles<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>b", ":FzfLua buffers<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>f", ":FzfLua files<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>gs", ":FzfLua git_status<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>w", ":FzfLua live_grep<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>W", ":FzfLua live_grep_resume<Enter>", opts)
vim.api.nvim_set_keymap("n", "<Space>M", ":FzfLua lsp_document_diagnostics<Enter>", opts)
