local H = {}

H.enable_copilot = function()
  -- Lazy load copilot server
  if vim.fn.exists("*copilot#RunningClient") == 0 then
    require("lazy.core.loader").load("copilot.vim", {}, {})
    vim.cmd("runtime autoload/copilot.vim | call copilot#Init()")
  end
end

return {
  "github/copilot.vim",
  build = ":Copilot auth",
  cmd = "Copilot",
  cond = function()
    return require("util.command").executable("node")
  end,
  keys = {
    { "<Space>ce", H.enable_copilot, noremap = true, silent = true, desc = "Enable Copilot" },
  },
}
