if not require("util.command").executable("git") then
  return
end

local H = {
  mini_site_path = vim.fn.stdpath("data") .. "/site/",
  mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.nvim",
  mini_url = "https://github.com/echasnovski/mini.nvim.git",
}

H.bootstrap = function()
  if require("util.file").file_exists(H.mini_path) then
    return
  end

  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    H.mini_url,
    "--branch=main",
    H.mini_path,
  })
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

H.setup = function()
  require("mini.deps").setup({ path = { package = H.mini_site_path } })
  vim.keymap.set(
    "n",
    "<Space>z",
    ":DepsUpdate<Enter>",
    { noremap = true, silent = true, desc = "Update plugins" }
  )
end

H.bootstrap()
H.setup()
