local config = vim.fn.stdpath("config") .. "/.config.json"

return require("util.file").read_json_file(config) or {}
