local buffer = require("util.buffer")

local H = {}

H.max_size = 1024 * 128

H.exclude_filetype = vim.list_extend({ "csv" }, buffer.exclude.filetype)

return H
