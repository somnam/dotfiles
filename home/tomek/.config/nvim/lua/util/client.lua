local M = {
  formatter_names_by_ft = {},
}

M.get_lsp_client_names = function()
  local client_names = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    table.insert(client_names, client.name)
  end
  return client_names
end

M.get_formatter_names = function()
  local filetype = vim.bo.filetype
  if M.formatter_names_by_ft[filetype] ~= nil then
    return M.formatter_names_by_ft[filetype]
  end
  if not pcall(require, "conform") then
    return {}
  end

  local formatters = require("conform").list_formatters()
  local formatter_names = {}
  for _, formatter in ipairs(formatters) do
    if formatter.available then
      table.insert(formatter_names, formatter.command)
    end
  end
  M.formatter_names_by_ft[filetype] = formatter_names

  return formatter_names
end

M.get_linter_names = function()
  if not pcall(require, "lint") then
    return {}
  end

  return (require("lint").linters_by_ft[vim.bo.filetype] or {})
end

M.get_clients_set = function()
  local client_names_set = {}

  for _, client_names in ipairs({
    M.get_lsp_client_names(),
    M.get_linter_names(),
    M.get_formatter_names(),
  }) do
    for _, client_name in ipairs(client_names) do
      if client_names_set[client_name] == nil then
        client_names_set[client_name] = true
      end
    end
  end

  return client_names_set
end

M.get_clients_string = function()
  local client_names_set = M.get_clients_set()
  local unique_client_names = vim.tbl_keys(client_names_set)
  table.sort(unique_client_names)

  return table.concat(unique_client_names, " ")
end

M.get_clients_count = function()
  local client_names_set = M.get_clients_set()
  return #vim.tbl_keys(client_names_set)
end

M.has_clients = function()
  if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
    return true
  end

  if pcall(require, "lint") then
    if #(require("lint").linters_by_ft[vim.bo.filetype] or {}) > 0 then
      return true
    end
  end

  if pcall(require, "conform") then
    local conform = require("conform")
    local bufnr = vim.api.nvim_get_current_buf()
    local formatters = conform.list_formatters_for_buffer(bufnr)
    return #conform.resolve_formatters(formatters, bufnr, false, true) > 0
  end

  return false
end

return M
