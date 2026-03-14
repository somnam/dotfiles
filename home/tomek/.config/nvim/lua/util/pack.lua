local function bootstrap()
  local mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.nvim"
  if require("util.file").file_exists(mini_path) then
    return
  end

  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/nvim-mini/mini.nvim",
    "--branch=main",
    mini_path,
  })
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to clone mini.nvim: " .. result, vim.log.levels.ERROR)
    return
  end

  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

local M = {}

M.init = function()
  if vim.fn.executable("git") ~= 1 then
    vim.notify("git not installed; plugins skipped.", vim.log.levels.ERROR)
    return
  end

  bootstrap()

  require("mini.deps").setup()

  vim.api.nvim_create_user_command("DepsSync", function()
    vim.cmd("DepsClean!")
    vim.cmd("DepsUpdate")
  end, { desc = "Sync plugins" })
end

return M
