local available, packer = pcall(require, "packer")
if not available then return end

local H = {}

H.plugin_path = vim.fn.stdpath('config') .. "/lua/plugin/"

H.plugin_source = function(_)
  vim.cmd("source " .. H.plugin_path .. "init.lua")
end

H.plugin_read = function(file)
  local plugin_available, plugin = pcall(dofile, H.plugin_path .. file)
  return plugin_available and plugin or nil
end

-- autocmd
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/nvim/lua/plugin/*.lua",
  group = vim.api.nvim_create_augroup("packer_auto_source", { clear = true }),
  callback = H.plugin_source,
})

packer.startup(function(use)
  use {"wbthomason/packer.nvim"}
  use (H.plugin_read("mini.lua"))
  use (H.plugin_read("alpha-nvim.lua"))
  use (H.plugin_read("guess-indent.lua"))
  use (H.plugin_read("indent-blankline.lua"))
  use (H.plugin_read("nvim-lspconfig.lua"))
  use (H.plugin_read("gitsigns.lua"))
  use (H.plugin_read("nvim-treesitter.lua"))
  use (H.plugin_read("nvim-lint.lua"))
  use (H.plugin_read("formatter.lua"))
  use (H.plugin_read("lualine.lua"))
  use (H.plugin_read("fzf-lua.lua"))
  use (H.plugin_read("nvim-tree.lua"))
  use (H.plugin_read("nvim-cmp.lua"))
  use (H.plugin_read("toggleterm.lua"))
  use (H.plugin_read("codedark.lua"))
  use (H.plugin_read("vscode.lua"))
  use (H.plugin_read("dracula.lua"))
end)
