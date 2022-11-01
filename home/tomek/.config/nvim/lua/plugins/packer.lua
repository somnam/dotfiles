local available, packer = pcall(require, "packer")
if not available then return end

packer.startup(function()
  use {'wbthomason/packer.nvim'}
  use {'echasnovski/mini.nvim'}
  use {'glepnir/dashboard-nvim'}
  use {'nmac427/guess-indent.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'lewis6991/gitsigns.nvim'}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {'mfussenegger/nvim-lint'}
  use {'mhartington/formatter.nvim'}
  use {'nvim-lualine/lualine.nvim'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { {'nvim-telescope/telescope.nvim'} }
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
    }
  }
  use {'tomasiser/vim-code-dark'}
  use {'Mofiqul/vscode.nvim'}
end)
