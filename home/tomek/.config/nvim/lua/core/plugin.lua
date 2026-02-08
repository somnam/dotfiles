if vim.fn.executable("git") ~= 1 then
  vim.notify("git not installed; plugin bootstrap skipped.", vim.log.levels.WARN)
  return
end

local mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.nvim"
local mini_url = "https://github.com/nvim-mini/mini.nvim"

local function bootstrap()
  if require("util.file").file_exists(mini_path) then
    return
  end

  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    mini_url,
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

local function setup()
  require("mini.deps").setup()

  vim.api.nvim_create_user_command("DepsSync", function()
    vim.cmd("DepsClean!")
    vim.cmd("DepsUpdate")
  end, { desc = "Sync plugins" })
  vim.keymap.set(
    "n",
    "<leader>s",
    ":DepsSync<Enter>",
    { noremap = true, silent = true, desc = "Sync plugins" }
  )
end

bootstrap()
setup()
