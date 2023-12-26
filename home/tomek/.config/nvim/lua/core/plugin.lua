local git_available = vim.fn.executable("git") == 1
if not git_available then return end

local H = {}

H.lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

H.lazy_url = "https://github.com/folke/lazy.nvim.git"

H.bootstrap = function()
  if not vim.loop.fs_stat(H.lazy_path) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      H.lazy_url,
      "--branch=stable", -- latest stable release
      H.lazy_path,
    })
  end

  vim.opt.rtp:prepend(H.lazy_path)
end

H.setup = function()
  vim.api.nvim_set_keymap(
    "n", "<Space>z", ":Lazy<Enter>",
    {noremap = true, silent = true, desc = "Open the Plugin Manager UI"}
  )

  require("lazy").setup(
    {
      spec = {
        {import = "plugin"},
      },
      checker = {
        enabled = true,
        notify = false,
        frequency = 3600 * 24,
      },
      change_detection = {
        notify = false,
      },
      ui = {
        border = "rounded",
      },
    }
  )
end

H.bootstrap()
H.setup()
