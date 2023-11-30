return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VimEnter",
  config = function()
    local nvim_treesitter_configs = require("nvim-treesitter.configs")
    local buffer = require("util.buffer")

    local H = {}

    H.exclude_filetype = vim.list_extend(
      {"bash", "yaml"},
      buffer.exclude.filetype
    )

    H.max_size = 1024 * 128

    H.maybe_disable_treesitter = function(filetype, bufnr)
      return (
        vim.tbl_contains(H.exclude_filetype, filetype)
        or buffer.above_max_size(bufnr, H.max_size)
      )
    end

    -- setup
    nvim_treesitter_configs.setup({
      auto_install = true,
      ignore_install = H.exclude_filetype,
      highlight = {
        enable = true,
        disable = H.maybe_disable_treesitter,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = {"lua"},
      },
    })
  end
}
