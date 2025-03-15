local buffer = require("core.buffer")
local config = require("core.config")

return {
  max_size = 1024 * 1024,
  exclude_filetype = vim.list_extend(config.get("treesitter.exclude", {}), buffer.exclude.filetype),
}
