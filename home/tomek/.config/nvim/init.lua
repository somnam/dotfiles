-- Core config
vim.cmd("runtime! core/**/*.lua")

-- Packages
require("util.pack").init()
