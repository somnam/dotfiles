local P = {"nvim-treesitter/nvim-treesitter"}

P.config = function()
  local nvim_treesitter_configs = require("nvim-treesitter.configs")

  -- setup
  nvim_treesitter_configs.setup({
    highlight = {
      enable = true,
      disable = { "json", "yaml" },
      additional_vim_regex_highlighting = false,
    }
  })
end

return P
