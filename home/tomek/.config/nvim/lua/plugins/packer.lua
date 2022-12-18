local available, packer = pcall(require, "packer")
if not available then return end

local function packer_auto_source()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/nvim/lua/plugins/packer.lua",
    group = vim.api.nvim_create_augroup("packer_auto_source", { clear = true }),
    callback = function(ctx)
      vim.cmd("source " .. ctx.file)
    end
  })
end

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
  use {'SidOfc/carbon.nvim'}
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
    }
  }
  use {"tomasiser/vim-code-dark"}
  use {"Mofiqul/vscode.nvim"}
end)

packer_auto_source()
