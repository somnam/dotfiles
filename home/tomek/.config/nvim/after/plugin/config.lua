local config = require('core.config')

vim.cmd(string.format([[silent! colorscheme %s]], config.colorscheme))
