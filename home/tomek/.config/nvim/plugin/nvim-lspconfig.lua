local command = require("util.command")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({ source = "neovim/nvim-lspconfig" })

  local H = {}

  H.servers = {
    "jedi_language_server",
    "pyright",
    "quick_lint_js",
    "vtsls",
    "rust_analyzer",
    "lua_ls",
  }

  ---@param server string
  ---@return boolean
  H.lsp_server_available = function(server)
    local cmd = vim.lsp.config[server].cmd
    if type(cmd) == "table" then
      return command.executable(cmd[1])
    end
    return type(cmd) == "function"
  end

  for _, server in ipairs(H.servers) do
    if H.lsp_server_available(server) then
      vim.lsp.enable(server)
    end
  end
end)
