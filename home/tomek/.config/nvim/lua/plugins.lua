-- Plugins

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'echasnovski/mini.nvim'
  use 'nmac427/guess-indent.nvim'
  use 'neovim/nvim-lspconfig'
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'mfussenegger/nvim-lint'
  use 'mhartington/formatter.nvim'
  use 'nvim-lualine/lualine.nvim'
end)
