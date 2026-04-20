if vim.fn.executable("node") ~= 1 then
  vim.notify("node not installed; copilot plugin skipped.", vim.log.levels.WARN)
  return
end

local buffer = require("util.buffer")
local config = require("util.config")

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "copilot.vim" and ev.data.kind == "update" then
      vim.cmd("silent! Copilot setup")
    end
  end,
})

vim.pack.add(
  { "https://github.com/github/copilot.vim" },
  { load = config.get("plugin.copilot.enable") }
)

if config.get("plugin.copilot.enable") then
  local copilot_filetypes = {}
  for _, filetype in ipairs(buffer.exclude_filetype) do
    copilot_filetypes[filetype] = false
  end
  vim.g.copilot_filetypes = copilot_filetypes
  vim.g.copilot_workspace_folders = config.get("plugin.copilot.workspace_folders", {})
  vim.g.copilot_idle_delay = config.get("plugin.copilot.idle_delay", 150)
end
