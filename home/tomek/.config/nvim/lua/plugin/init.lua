local available, packer = pcall(require, "packer")
if not available then return end

local H = {}

H.path = vim.fn.stdpath('config') .. "/lua/plugin/"

H.source = function(_)
  vim.cmd("source " .. H.path .. "init.lua")
end

H.plugin_file = function(filename)
  return H.path .. filename .. ".lua"
end

H.plugin = function(filename)
  local plugin_available, plugin = pcall(dofile, H.plugin_file(filename))
  return plugin_available and plugin or nil
end

-- autocmd
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/nvim/lua/plugin/*.lua",
  group = vim.api.nvim_create_augroup("packer_auto_source", { clear = true }),
  callback = H.source,
})

packer.startup(function(use)
  use {"wbthomason/packer.nvim"}
  use (H.plugin("mini"))
  use (H.plugin("alpha-nvim"))
  use (H.plugin("guess-indent"))
  use (H.plugin("indent-blankline"))
  use (H.plugin("nvim-lspconfig"))
  use (H.plugin("gitsigns"))
  use (H.plugin("nvim-treesitter"))
  use (H.plugin("nvim-lint"))
  use (H.plugin("formatter"))
  use (H.plugin("lualine"))
  use (H.plugin("fzf-lua"))
  use (H.plugin("nvim-tree"))
  use (H.plugin("nvim-cmp"))
  use (H.plugin("toggleterm"))
  use (H.plugin("vscode"))
  use (H.plugin("dracula"))
  use (H.plugin("kanagawa"))
end)
