local config = require("util.config")

MiniDeps.now(function()
  MiniDeps.add({ source = "neovim/nvim-lspconfig" })

  ---@type string[]
  local servers = config.get("lsp.servers", {})
  for _, server in ipairs(servers) do
    vim.lsp.enable(server)
  end
end)
