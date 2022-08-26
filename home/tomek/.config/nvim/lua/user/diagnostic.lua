local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<Space>d[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<Space>d]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Space>dm', vim.diagnostic.setloclist, opts)
