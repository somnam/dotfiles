local buffer = require("util.buffer")
local config = require("util.config")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_install = function()
        vim.cmd("TSUpdate")
      end,
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })

  local exclude_filetypes = config.get("treesitter.exclude", {})

  require("nvim-treesitter.configs").setup({
    auto_install = true,
    ensure_installed = config.get("treesitter.ensure_installed", {}),
    ignore_install = config.get("treesitter.exclude", {}),
    highlight = {
      enable = true,
      disable = function(_, bufnr)
        return buffer.excluded_or_above_max_size(bufnr, exclude_filetypes)
      end,
    },
  })
end)
