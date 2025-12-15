local M = {
  formatters_by_ft = {},
  linters_by_ft = {},
  lsp_names_map = { ["GitHub Copilot"] = "copilot" },
}

---@param formatters_by_ft { [string]: string[] }
M.set_formatters_by_ft = function(formatters_by_ft)
  M.formatters_by_ft = formatters_by_ft
end

---@param linters_by_ft { [string]: string[] }
M.set_linters_by_ft = function(linters_by_ft)
  M.linters_by_ft = linters_by_ft
end

---@return string[]
M.get_lsp__names = function()
  local lsp_names = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    table.insert(lsp_names, M.lsp_names_map[client.name] or client.name)
  end
  return lsp_names
end

---@return string[]
M.get_formatter_names = function()
  return M.formatters_by_ft[vim.bo.filetype] or {}
end

---@return string[]
M.get_linter_names = function()
  return M.linters_by_ft[vim.bo.filetype] or {}
end

M.get_names_set = function()
  local names_set = {}

  for _, names in ipairs({
    M.get_lsp__names(),
    M.get_linter_names(),
    M.get_formatter_names(),
  }) do
    for _, name in ipairs(names) do
      names_set[name] = true
    end
  end

  return names_set
end

---@return { [string]: string[] }
M.get_names = function()
  local names_set = M.get_names_set()
  local names = vim.tbl_keys(names_set)
  table.sort(names)

  return names
end

---@return integer
M.get_count = function()
  local names_set = M.get_names_set()
  return vim.tbl_count(names_set)
end

return M
