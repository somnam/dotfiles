local available, packer = pcall(require, "packer")
if not available then return end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/nvim/lua/plugins.lua",
  group = vim.api.nvim_create_augroup("packer_auto_source", { clear = true }),
  callback = function(ctx)
    vim.cmd("source " .. ctx.file)
  end
})

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
  use {"ibhagwan/fzf-lua"}
  use {"nvim-tree/nvim-tree.lua"}
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
    }
  }
  use {"akinsho/toggleterm.nvim"}
  use {
    "tomasiser/vim-code-dark",
    opt = true,
    event ="ColorSchemePre coldedark",
  }
  use {
    "Mofiqul/vscode.nvim",
    opt = true,
    event = "ColorSchemePre vscode",
  }
  use {
    "Mofiqul/dracula.nvim",
    opt = true,
    event = "ColorSchemePre dracula"
  }
end)
