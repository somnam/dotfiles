local M = {}

---@type string
M.path_separator = vim.fn.has("win32") == 1 and ";" or ":"

--- @return boolean
M.file_exists = function(file)
  return vim.uv.fs_stat(file) ~= nil
end

--- @return string?
M.read_file = function(file)
  if not M.file_exists(file) then
    return
  end

  local fd = assert(io.open(file, "r"))
  local content = fd:read("*a")
  fd:close()
  return content
end

--- @return table
M.read_json_file = function(file)
  local content = M.read_file(file)
  if not content then
    return {}
  end

  local opts = { luanil = { object = true, array = true } }
  local json_ok, json_data = pcall(vim.json.decode, content, opts)
  return json_ok and json_data or nil
end

---@return string?
M.current_file_size = function()
  local size = vim.fn.getfsize(vim.fn.getreg("%"))

  if size >= 1e9 then
    return string.format("%.2fG", size / 1e9)
  elseif size >= 1e6 then
    return string.format("%.2fM", size / 1e6)
  elseif size >= 1e3 then
    return string.format("%.2fk", size / 1e3)
  elseif size >= 1 then
    return string.format("%db", size)
  end
end

return M
