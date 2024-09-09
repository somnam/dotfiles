local buffer = require("core.buffer")
local treesitter = require("core.treesitter")

local H = {}

H.maybe_disable_treesitter = function(filetype, bufnr)
  return (
    vim.tbl_contains(treesitter.exclude_filetype, filetype)
    or buffer.above_max_size(bufnr, treesitter.max_size)
  )
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VimEnter",
  opts = {
    auto_install = true,
    ignore_install = treesitter.exclude_filetype,
    highlight = {
      enable = true,
      disable = H.maybe_disable_treesitter,
      additional_vim_regex_highlighting = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
