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

  local formatter_ok, format = pcall(require, "conform")
  if not formatter_ok then
    return {}
  end

  local formatters = format.list_formatters()
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
  local linkt_ok, lint = pcall(require, "lint")
  if not linkt_ok then
    return {}
  end

  return (lint.linters_by_ft[vim.bo.filetype] or {})
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

  local formatter_ok, format = pcall(require, "conform")
  if formatter_ok then
    local filetype = vim.bo.filetype ~= "" and vim.bo.filetype or "_"
    local has_ft_formatters = #(format.formatters_by_ft[filetype] or {}) > 0
    local has_any_formatters = #(format.formatters_by_ft["*"] or {}) > 0
    return has_ft_formatters or has_any_formatters
  end

  local lint_ok, lint = pcall(require, "lint")
  if lint_ok and #(lint.linters_by_ft[vim.bo.filetype] or {}) > 0 then
    return true
  end

  return false
end

return M
