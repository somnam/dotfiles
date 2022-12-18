local available, gitsigns = pcall(require, "gitsigns")
if not available then return end

local on_attach = function(bufnr)
  local bufopts = {noremap = true, silent = true}

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>gd", ":Gitsigns diffthis<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>g[", ":Gitsigns prev_hunk<Enter>", bufopts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>g]", ":Gitsigns next_hunk<Enter>", bufopts)
end

gitsigns.setup({
  signs = {
    delete       = {show_count = true},
    topdelete    = {show_count = true},
    changedelete = {show_count = true},
  },
  on_attach = on_attach,
  current_line_blame = true,
  current_line_blame_formatter = "<author> (<author_time:%Y-%m-%d>) <abbrev_sha>: <summary>",
  update_debounce = 1000,
})
