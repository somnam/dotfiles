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
  local ensure_installed = config.get("treesitter.ensure_installed", {})
  ---@type string[]
  local exclude_filetypes = config.get("treesitter.exclude", {})
  ---@type table
  local treesitter = require("nvim-treesitter")

  local available_parsers = {}
  for _, name in ipairs(treesitter.get_available()) do
    available_parsers[name] = true
  end

  ---@return table<string, boolean>
  local function get_installed_parsers()
    local installed_parsers = {}
    for _, name in ipairs(treesitter.get_installed("parsers")) do
      installed_parsers[name] = true
    end
    return installed_parsers
  end

  local function check_installed_parsers()
    local installed_parsers = get_installed_parsers()
    for _, parser_name in ipairs(ensure_installed) do
      if not installed_parsers[parser_name] then
        pcall(treesitter.install, parser_name)
      end
    end
  end

  ---@param bufnr integer
  local function auto_install_treesitter(bufnr)
    if buffer.excluded_or_above_max_size(bufnr, exclude_filetypes) then
      return
    end

    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
    local parser = vim.treesitter.language.get_lang(filetype) or filetype
    if not available_parsers[parser] then
      return
    end

    local installed_parsers = get_installed_parsers()
    if not installed_parsers[parser] then
      pcall(treesitter.install, parser)
    end

    pcall(vim.treesitter.start, bufnr)
  end

  check_installed_parsers()

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("auto_install_treesitter", { clear = true }),
    callback = function(event)
      auto_install_treesitter(event.buf)
    end,
  })
end)
