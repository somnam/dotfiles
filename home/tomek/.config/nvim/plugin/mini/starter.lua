local now = require("mini.deps").now

now(function()
  local mini_starter = require("mini.starter")
  local mini_pick = require("mini.pick")
  local mini_extra = require("mini.extra")
  local version = vim.version()

  mini_starter.setup({
    header = string.format("NVIM v%d.%d.%d", version.major, version.minor, version.patch),
    items = {
      {
        action = function() mini_extra.pickers.oldfiles({ current_dir = true }) end,
        name = "Previous files",
        section = "",
      },
      {
        action = function() mini_pick.registry.files() end,
        name = "Files search",
        section = "",
      },
      {
        action = function() mini_pick.registry.grep_live() end,
        name = "Words search",
        section = "",
      },
      { action = "DepsSync", name = "Sync plugins", section = "" },
      { action = "enew", name = "New file", section = "" },
      { action = "qall", name = "Quit", section = "" },
    },
    footer = "",
    evaluate_single = true,
    content_hooks = {
      mini_starter.gen_hook.adding_bullet(),
      mini_starter.gen_hook.padding(3, 1),
    },
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniStarterOpened",
    group = vim.api.nvim_create_augroup("mini_starter_opened", { clear = true }),
    callback = function(ctx)
      local opts = { silent = true, buffer = ctx.buf }
      vim.keymap.set("n", "k", "<Cmd>lua MiniStarter.update_current_item('prev')<Enter>", opts)
      vim.keymap.set("n", "j", "<Cmd>lua MiniStarter.update_current_item('next')<Enter>", opts)
    end,
  })
end)
