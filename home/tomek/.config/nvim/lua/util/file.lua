local M = {}

M.file_exists = function(file)
  return vim.loop.fs_stat(file) ~= nil
end

M.read_file = function(file)
  if not M.file_exists(file) then return nil end

  local fd = io.open(file, "r")
  local data = fd:read("*a")
  fd:close()
  return data
end

M.read_json_file = function(file)
  local content = M.read_file(file)
  if not content then return {} end

  local json_ok, json_data = pcall(vim.json.decode, content)
  return json_ok and json_data or {}
end

return M
