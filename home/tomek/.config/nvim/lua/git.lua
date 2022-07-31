local available, _ = pcall(require, "gitsigns")
if not available then return end

local on_attach = function(bufnr)
  local bufopts = {noremap = true, silent = true, buffer = bufnr}

  vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<Enter>", bufopts)
  vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<Enter>", bufopts)
end

require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn', show_count = true},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn', show_count = true},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn', show_count = true},
  },
  on_attach = on_attach,
  update_debounce = 250,
})
