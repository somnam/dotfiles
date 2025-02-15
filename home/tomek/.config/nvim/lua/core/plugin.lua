if vim.fn.executable("git") ~= 1 then
  return
end

local config = require("core.config")

local H = {
  lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
  lazy_url = "https://github.com/folke/lazy.nvim.git",
}

H.bootstrap = function()
  if not vim.uv.fs_stat(H.lazy_path) then
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
    "n",
    "<Space>z",
    ":Lazy<Enter>",
    { noremap = true, silent = true, desc = "Open the Plugin Manager UI" }
  )

  require("lazy").setup({
    spec = {
      { "folke/lazy.nvim", version = "*" },
      { import = "plugin" },
    },
    checker = {
      enabled = true,
      notify = false,
      frequency = 3600 * 24,
    },
    change_detection = {
      notify = false,
    },
    install = {
      colorscheme = { config.get("colorscheme", "default") },
    },
    ui = {
      size = { width = 0.65 },
      icons = {
        cmd = "⌘",
        config = "⚙",
        event = "ϟ",
        favorite = "★",
        ft = "*",
        init = "✓",
        import = "@",
        keys = "⌨",
        plugin = "⬠",
        runtime = "⏱",
        require = "#",
        source = "⧆",
        start = "▶",
        task = "⧗",
        lazy = "~",
      },
      border = "rounded",
    },
  })
end

H.bootstrap()
H.setup()
