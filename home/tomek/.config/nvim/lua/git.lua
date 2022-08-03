local available, gitsigns = pcall(require, "gitsigns")
if not available then return end

local on_attach = function(bufnr)
  local bufopts = {noremap = true, silent = true, buffer = bufnr}

  vim.keymap.set("n", "<Space>gd", ":Gitsigns diffthis<Enter>", bufopts)
  vim.keymap.set("n", "<Space>gb", ":Gitsigns toggle_current_line_blame<Enter>", bufopts)
end

gitsigns.setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '!', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn', show_count = true},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn', show_count = true},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn', show_count = true},
  },
  on_attach = on_attach,
  update_debounce = 250,
})
