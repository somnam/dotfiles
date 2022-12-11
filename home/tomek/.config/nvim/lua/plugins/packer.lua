local available, packer = pcall(require, "packer")
if not available then return end

packer.startup(function()
  use {"wbthomason/packer.nvim"}
  use {"echasnovski/mini.nvim"}
  use {"goolord/alpha-nvim"}
  use {"nmac427/guess-indent.nvim"}
  use {"lukas-reineke/indent-blankline.nvim"}
  use {"neovim/nvim-lspconfig"}
  use {"lewis6991/gitsigns.nvim"}
  use {"nvim-treesitter/nvim-treesitter"}
  use {"mfussenegger/nvim-lint"}
  use {"mhartington/formatter.nvim"}
  use {"nvim-lualine/lualine.nvim"}
  use {'ibhagwan/fzf-lua'}
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lsp-signature-help"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
    }
  }
  use {"tomasiser/vim-code-dark"}
  use {"Mofiqul/vscode.nvim"}
end)
