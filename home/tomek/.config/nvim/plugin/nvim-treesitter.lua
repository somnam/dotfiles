if vim.fn.executable("tree-sitter") ~= 1 then
  vim.notify("tree-sitter-cli not installed; nvim-treesitter plugin skipped.", vim.log.levels.WARN)
  return
end

local buffer = require("util.buffer")
local config = require("util.config")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "main",
    hooks = {
      post_install = function()
        vim.cmd("TSUpdate")
      end,
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })

  ---@type string[]
  local exclude_filetypes = config.get("treesitter.exclude", {})
  ---@type table
  local treesitter = require("nvim-treesitter")

  local available_parsers = {}
  for _, name in ipairs(treesitter.get_available()) do
    available_parsers[name] = true
  end

  ---@param bufnr integer
  local function get_parser(bufnr)
    local filetype = vim.bo[bufnr].filetype
    return vim.treesitter.language.get_lang(filetype) or filetype
  end

  ---@param bufnr integer
  local function auto_install_parser(bufnr)
    if buffer.excluded_or_above_max_size(bufnr, exclude_filetypes) then
      return
    end

    local parser = get_parser(bufnr)
    if not available_parsers[parser] then
      return
    end

    pcall(vim.treesitter.start, bufnr)
    pcall(treesitter.install, parser)
  end

  pcall(treesitter.install, config.get("treesitter.ensure_installed", {}))

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("auto_install_treesitter_parser", { clear = true }),
    callback = function(event)
      auto_install_parser(event.buf)
    end,
  })
end)
