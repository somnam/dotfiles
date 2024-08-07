local buffer = require("core.buffer")
local config = require("core.config")

local H = {}

H.max_size = 1024 * 512

H.exclude_filetype = vim.list_extend(config.treesitter.exclude or {}, buffer.exclude.filetype)

return H
