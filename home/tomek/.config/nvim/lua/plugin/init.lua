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
  -- keymap
  local opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap(
    "n", "<Space>z", ":Lazy<Enter>",
    vim.tbl_extend("keep", {desc = "Open the Plugin Manager UI"}, opts)
  )

  require("lazy").setup(
    "plugin.spec",
    {
      checker = {
        enabled = true,
        notify = false,
        frequency = 3600 * 24,
      },
      change_detection = {
        enabled = false,
      },
      ui = {
        border = "rounded",
      },
    }
  )
end

H.bootstrap()
H.setup()
