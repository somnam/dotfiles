local available, packer = pcall(require, "packer")
if not available then return end

local use = packer.use

packer.startup({
  function()
    use (require("plugin.packer"))
    use (require("plugin.mini"))
    use (require("plugin.alpha-nvim"))
    use (require("plugin.guess-indent"))
    use (require("plugin.indent-blankline"))
    use (require("plugin.nvim-lspconfig"))
    use (require("plugin.gitsigns"))
    use (require("plugin.nvim-treesitter"))
    use (require("plugin.nvim-lint"))
    use (require("plugin.formatter"))
    use (require("plugin.lualine"))
    use (require("plugin.fzf-lua"))
    use (require("plugin.nvim-tree"))
    use (require("plugin.nvim-cmp"))
    use (require("plugin.toggleterm"))
    use (require("plugin.codedark"))
    use (require("plugin.vscode"))
    use (require("plugin.dracula"))
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end
    }
  },
})
