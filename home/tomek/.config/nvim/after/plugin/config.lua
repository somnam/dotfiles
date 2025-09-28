local config = require("util.config")

vim.cmd(string.format([[set background=%s]], config.get("background", "dark")))
vim.cmd(string.format([[silent! colorscheme %s]], config.get("colorscheme", "default")))
