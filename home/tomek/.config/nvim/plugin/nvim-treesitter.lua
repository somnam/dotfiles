local config = require("util.config")
local treesitter = require("util.treesitter")
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

  require("nvim-treesitter.configs").setup({
    auto_install = true,
    ensure_installed = config.get("treesitter.ensure_installed", {}),
    ignore_install = treesitter.exclude_filetype,
    highlight = {
      enable = true,
      disable = function(_, bufnr)
        return treesitter.maybe_disable_treesitter(bufnr)
      end,
    },
  })
end)
