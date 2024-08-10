local config = require("core.config")

vim.cmd(string.format([[set background=%s]], (config.background or "dark")))
vim.cmd(string.format([[silent! colorscheme %s]], (config.colorscheme or "default")))
