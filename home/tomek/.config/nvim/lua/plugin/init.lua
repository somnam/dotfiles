local available, packer = pcall(require, "packer")
if not available then return end

local H = {}

H.plugin_path = vim.fn.stdpath('config') .. "/lua/plugin/"

H.plugin_source = function(_)
  vim.cmd("source " .. H.plugin_path .. "init.lua")
end

H.config ={
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end
  }
}

-- autocmd
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/nvim/lua/plugin/*.lua",
  group = vim.api.nvim_create_augroup("packer_auto_source", { clear = true }),
  callback = H.plugin_source,
})

packer.startup({
  function(use)
    use {"wbthomason/packer.nvim"}
    use (dofile(H.plugin_path .. "mini.lua"))
    use (dofile(H.plugin_path .. "alpha-nvim.lua"))
    use (dofile(H.plugin_path .. "guess-indent.lua"))
    use (dofile(H.plugin_path .. "indent-blankline.lua"))
    use (dofile(H.plugin_path .. "nvim-lspconfig.lua"))
    use (dofile(H.plugin_path .. "gitsigns.lua"))
    use (dofile(H.plugin_path .. "nvim-treesitter.lua"))
    use (dofile(H.plugin_path .. "nvim-lint.lua"))
    use (dofile(H.plugin_path .. "formatter.lua"))
    use (dofile(H.plugin_path .. "lualine.lua"))
    use (dofile(H.plugin_path .. "fzf-lua.lua"))
    use (dofile(H.plugin_path .. "nvim-tree.lua"))
    use (dofile(H.plugin_path .. "nvim-cmp.lua"))
    use (dofile(H.plugin_path .. "toggleterm.lua"))
    use (dofile(H.plugin_path .. "codedark.lua"))
    use (dofile(H.plugin_path .. "vscode.lua"))
    use (dofile(H.plugin_path .. "dracula.lua"))
  end,
  config = H.config,
})
