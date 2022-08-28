local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<Space>d[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<Space>d]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Space>dm', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<Space>df', vim.diagnostic.open_float, opts)

local diagnostic_opts = {
  virtual_text = {
    severity = { min = 'ERROR' },
  },
  update_in_insert = false,
}
vim.diagnostic.config(diagnostic_opts)
