local misc = require("util.misc")
local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({ source = "goolord/alpha-nvim" })

  local H = {}

  H.labels = {
    find_recent = "›  Recent files",
    find_file = "›  Find files",
    find_word = "›  Find in files",
    new_file = "›  New file",
    plugins = "›  Plugins",
    quit = "›  Quit",
  }

  H.header = function()
    local blank = ""
    return { blank, string.format("NVIM %s", misc.nvim_version()), blank }
  end

  H.trigger_close_on_new_buffer = function(ctx)
    vim.api.nvim_create_autocmd("BufAdd", {
      pattern = "*",
      once = true,
      callback = function()
        vim.schedule(function()
          if vim.api.nvim_buf_is_loaded(ctx.buf) then
            pcall(vim.api.nvim_buf_delete, ctx.buf, {})
          end
        end)
      end,
    })
  end

  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.header.val = H.header()
  dashboard.section.buttons.val = {
    dashboard.button("<Leader> p ", H.labels.find_recent, ":FzfLua oldfiles cwd_only=true<Enter>"),
    dashboard.button("<Leader> f ", H.labels.find_file, ":FzfLua files<Enter>"),
    dashboard.button("<Leader> w ", H.labels.find_word, ":FzfLua live_grep<Enter>"),
    dashboard.button("<Leader> n ", H.labels.new_file, ":enew<Enter>"),
    dashboard.button("<Leader> z ", H.labels.plugins, ":Lazy<Enter>"),
    dashboard.button("<Leader> q ", H.labels.quit, ":qa<Enter>"),
  }
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    command = "setlocal nofoldenable",
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = H.trigger_close_on_new_buffer,
  })
end)
