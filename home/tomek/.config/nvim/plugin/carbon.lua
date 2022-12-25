local available, carbon = pcall(require, "carbon")
if not available then return end

carbon.setup({
  auto_open = false,
  sync_delay = 50,
  indicators = {expand = '▶', collapse = '▼'}
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Space>e", ":ToggleLcarbon<Enter>", opts)
