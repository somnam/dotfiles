vim.loader.enable()

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

local mini_misc = require("mini.misc")

_G.Config = {}
Config.now = function(func) mini_misc.safely("now", func) end
Config.later = function(func) mini_misc.safely("later", func) end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later
Config.on_event = function(ev, func) mini_misc.safely("event:" .. ev, func) end
Config.on_filetype = function(ft, func) mini_misc.safely("filetype:" .. ft, func) end

vim.api.nvim_create_user_command("PackUpdate", function() vim.pack.update() end, {})
