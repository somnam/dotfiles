local buffer = require("core.buffer")
local treesitter = require("core.treesitter")
local add = require("mini.deps").add
local later = require("mini.deps").later

local H = {}

H.maybe_disable_treesitter = function(filetype, bufnr)
  return (
    vim.tbl_contains(treesitter.exclude_filetype, filetype)
    or buffer.above_max_size(bufnr, treesitter.max_size)
  )
end

later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
  require("nvim-treesitter.configs").setup({
    auto_install = true,
    ignore_install = treesitter.exclude_filetype,
    highlight = {
      enable = true,
      disable = H.maybe_disable_treesitter,
    },
  })
end)
