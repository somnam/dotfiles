local available, gitsigns = pcall(require, "gitsigns")
if not available then return end

local on_attach = function(bufnr)
  local bufopts = {noremap = true, silent = true, buffer = bufnr}

  vim.keymap.set("n", "<Space>gd", ":Gitsigns diffthis<Enter>", bufopts)
  vim.keymap.set("n", "<Space>gb", ":Gitsigns toggle_current_line_blame<Enter>", bufopts)
  vim.keymap.set("n", "<Space>g[", ":Gitsigns prev_hunk<Enter>", bufopts)
  vim.keymap.set("n", "<Space>g]", ":Gitsigns next_hunk<Enter>", bufopts)
end

gitsigns.setup({
  signs = {
    add          = {text = '+'},
    change       = {text = '!'},
    delete       = {text = '-', show_count = true},
    topdelete    = {text = '‾', show_count = true},
    changedelete = {text = '~', show_count = true},
  },
  on_attach = on_attach,
  update_debounce = 1000,
})
