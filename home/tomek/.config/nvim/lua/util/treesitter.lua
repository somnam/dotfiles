local buffer = require("util.buffer")
local config = require("util.config")

local M = {
  max_size = 1024 * 1024,
  exclude_filetype = vim.list_extend(config.get("treesitter.exclude", {}), buffer.exclude.filetype),
}

---@param buf integer
M.maybe_disable_treesitter = function(buf)
  return (buffer.excluded(buf, M.exclude_filetype) or buffer.above_max_size(buf, M.max_size))
end

return M
