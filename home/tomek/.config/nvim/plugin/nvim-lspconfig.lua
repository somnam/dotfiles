Config.now_if_args(function()
  vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
  local config = require("util.config")

  ---@type string[]
  local servers = config.get("lsp.servers", {})
  for _, server in ipairs(servers) do
    vim.lsp.enable(server)
  end
end)
