local M = {}

M.file_exists = function(file)
  return vim.uv.fs_stat(file) ~= nil
end

M.read_file = function(file)
  if not M.file_exists(file) then
    return
  end

  local fd = assert(io.open(file, "r"))
  local content = fd:read("*a")
  fd:close()
  return content
end

M.read_json_file = function(file)
  local content = M.read_file(file)
  if not content then
    return
  end

  local json_ok, json_data = pcall(vim.json.decode, content)
  return json_ok and json_data or nil
end

M.current_file_size = function()
  local size = vim.fn.getfsize(vim.fn.getreg("%"))
  if size < 1 then
    return
  elseif size < 1024 then
    return string.format("%dB", size)
  elseif size < 1048576 then
    return string.format("%.2fKiB", size / 1024)
  else
    return string.format("%.2fMiB", size / 1048576)
  end
end

return M
