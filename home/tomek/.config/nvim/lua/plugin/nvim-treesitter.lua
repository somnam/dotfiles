local buffer = require("util.buffer")

local H = {}

H.max_size = 1024 * 128

H.exclude_filetype = vim.list_extend({ "bash", "json", "yaml" }, buffer.exclude.filetype)

H.maybe_disable_treesitter = function(filetype, bufnr)
  return (
    vim.tbl_contains(H.exclude_filetype, filetype) or buffer.above_max_size(bufnr, H.max_size)
  )
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VimEnter",
  opts = {
    auto_install = true,
    ignore_install = H.exclude_filetype,
    highlight = {
      enable = true,
      disable = H.maybe_disable_treesitter,
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
