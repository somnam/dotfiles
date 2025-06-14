local buffer = require("core.buffer")
local client = require("util.client")
local diagnostic = require("core.diagnostic")
local file = require("util.file")
local misc = require("util.misc")
local later = require("mini.deps").later
local now = require("mini.deps").now

now(function()
  local mini_starter = require("mini.starter")
  mini_starter.setup({
    header = string.format("NVIM %s", misc.nvim_version()),
    items = {
      { action = "FzfLua oldfiles cwd_only=true", name = "Previous files", section = "" },
      { action = "FzfLua files", name = "Files search", section = "" },
      { action = "FzfLua live_grep", name = "Words search", section = "" },
      { action = "DepsSync", name = "Sync plugins", section = "" },
      { action = "enew", name = "New file", section = "" },
      { action = "qall", name = "Quit", section = "" },
    },
    footer = "",
    evaluate_single = true,
    content_hooks = {
      mini_starter.gen_hook.adding_bullet(),
      mini_starter.gen_hook.aligning("center", "center"),
    },
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniStarterOpened",
    group = vim.api.nvim_create_augroup("mini_starter_opened", { clear = true }),
    callback = function(ctx)
      local opts = { silent = true, buffer = ctx.buf }
      vim.keymap.set("n", "k", "<Cmd>lua MiniStarter.update_current_item('prev')<Enter>", opts)
      vim.keymap.set("n", "j", "<Cmd>lua MiniStarter.update_current_item('next')<Enter>", opts)

      vim.api.nvim_create_autocmd("WinNew", {
        buffer = ctx.buf,
        callback = function()
          mini_starter.refresh()
        end,
      })

      vim.api.nvim_create_autocmd("BufAdd", {
        buffer = ctx.buf,
        callback = function()
          vim.schedule(function()
            if vim.api.nvim_buf_is_loaded(ctx.buf) then
              pcall(vim.api.nvim_buf_delete, ctx.buf, {})
            end
          end)
        end,
      })
    end,
  })
end)

now(function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("maybe_disable_mini_completion", { clear = true }),
    callback = function(ctx)
      if buffer.excluded(ctx.buf) then
        vim.b.minicompletion_disable = true
      end
    end,
  })

  local mini_completion = require("mini.completion")
  mini_completion.setup({
    set_vim_settings = false,
    delay = { completion = 100, info = 200, signature = -1 },
    window = {
      info = { border = "none" },
      signature = { border = "none" },
    },
    lsp_completion = {
      process_items = function(items, base)
        return mini_completion.default_process_items(items, base, { filtersort = "fuzzy" })
      end,
    },
  })

  vim.keymap.set("i", "<C-c>", function()
    pcall(mini_completion.stop)
    misc.feedkeys("<C-c>", "n")
  end)
end)

later(function()
  local mini_bufremove = require("mini.bufremove")
  mini_bufremove.setup()
  vim.api.nvim_create_user_command("BD", function()
    mini_bufremove.delete(0, true)
  end, {})
  vim.api.nvim_create_user_command("BW", function()
    mini_bufremove.wipeout(0, true)
  end, {})
end)

later(function()
  require("mini.pairs").setup({
    mappings = {
      ["("] = { neigh_pattern = "[^\\][%s%)%]%}]" },
      ["["] = { neigh_pattern = "[^\\][%s%)%]%}]" },
      ["{"] = { neigh_pattern = "[^\\][%s%)%]%}]" },
      ['"'] = { neigh_pattern = "[^A-Za-eg-z0-9%p][^%w%p]" },
      ["'"] = { neigh_pattern = "[^%w%p][^%w%p]" },
      ["`"] = { neigh_pattern = "[^%w%p][^%w%p]" },
    },
  })
end)

later(function()
  local mini_clue = require("mini.clue")
  mini_clue.setup({
    triggers = {
      -- Leader triggers
      { mode = "n", keys = "<Space>" },
      { mode = "x", keys = "<Space>" },

      -- `g` key
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },

      -- Go forward/backward
      { mode = "n", keys = "[" },
      { mode = "n", keys = "]" },

      -- Marks
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },

      -- Registers
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },

      -- Window commands
      { mode = "n", keys = "<C-w>" },

      -- `z` key
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },
    },
    clues = {
      mini_clue.gen_clues.g(),
      mini_clue.gen_clues.marks(),
      mini_clue.gen_clues.registers(),
      mini_clue.gen_clues.windows(),
      mini_clue.gen_clues.z(),
    },
    window = {
      config = {
        width = "auto",
        row = "auto",
        col = "auto",
      },
    },
  })
end)

later(function()
  require("mini.notify").setup({
    lsp_progress = { duration_last = 2000 },
  })
end)

now(function()
  local mini_statusline = require("mini.statusline")

  local H = {}

  ---@param args table
  H.section_diff = function(args)
    local summary = vim.b.minidiff_summary_string or vim.b.gitsigns_status or ""
    if #summary == 0 then
      return ""
    end

    return mini_statusline.section_diff(args)
  end

  ---@param args table
  H.section_clients = function(args)
    if not client.has_clients() then
      return ""
    end

    if mini_statusline.is_truncated(args.trunc_width) then
      return string.format("%s %d", args.icon, client.get_clients_count())
    end

    return string.format("%s %s", args.icon, client.get_clients_string())
  end

  ---@param args table
  H.section_fileinfo = function(args)
    local filetype = vim.bo.filetype
    if filetype == "" then
      return ""
    end

    if mini_statusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
      return string.format("%s %s", args.icon, filetype)
    end

    local format = vim.bo.fileformat
    return string.format("%s %s %s", args.icon, filetype, format)
  end

  ---@param args table
  H.section_filesize = function(args)
    if vim.bo.filetype == "" then
      return ""
    end

    if mini_statusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
      return ""
    end

    local size = file.current_file_size()
    if not size then
      return ""
    end

    return string.format("%s %s", args.icon, size)
  end

  H.section_location_truncated = "%3l:%-2c"
  H.section_location_full = "%3l:%-2c %P"
  H.section_location = function(args)
    if mini_statusline.is_truncated(args.trunc_width) then
      return H.section_location_truncated
    end

    return H.section_location_full
  end

  H.secion_filepath = "%f %m %r"

  H.signs_with_space = {}
  for type, value in pairs(diagnostic.signs) do
    H.signs_with_space[type] = value .. " "
  end

  H.section_codecompanion_wrapper = function()
    local state = {
      processing = false,
      spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      spinner_index = 1,
      timer = nil,
    }

    local function redraw_spinner()
      state.spinner_index = (state.spinner_index % #state.spinner_symbols) + 1
      vim.cmd("redrawstatus")
    end

    local function start_spinner()
      if not state.timer then
        state.timer = vim.loop.new_timer()
        state.timer:start(0, 100, vim.schedule_wrap(redraw_spinner))
      end
    end

    local function stop_spinner()
      if state.timer then
        state.timer:stop()
        state.timer:close()
        state.timer = nil
      end
      vim.cmd("redrawstatus")
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequest*",
      group = vim.api.nvim_create_augroup("CodeCompanionStatusline", { clear = true }),
      callback = function(event)
        if event.match == "CodeCompanionRequestStarted" then
          state.processing = true
          start_spinner()
        elseif event.match == "CodeCompanionRequestFinished" then
          state.processing = false
          stop_spinner()
        end
      end,
    })

    local function section_codecompanion(args)
      if not state.processing then
        return ""
      end

      local spinner = state.spinner_symbols[state.spinner_index]
      return mini_statusline.is_truncated(args.trunc_width) and spinner
        or string.format("%s CodeCompanion", spinner)
    end

    return section_codecompanion
  end

  H.section_codecompanion = H.section_codecompanion_wrapper()

  -- statusline
  H.content_active = function()
    local mode, mode_hl = mini_statusline.section_mode({ trunc_width = 75 })
    local git = mini_statusline.section_git({ icon = "", trunc_width = 40 })
    local diff = H.section_diff({ icon = "𝚫", trunc_width = 40 })
    local diagnostics = mini_statusline.section_diagnostics({
      icon = "",
      trunc_width = 40,
      signs = H.signs_with_space,
    })
    local clients = H.section_clients({ icon = "●", trunc_width = 120 })
    local fileinfo = H.section_fileinfo({ icon = "≋", trunc_width = 75 })
    local filesize = H.section_filesize({ icon = "◔", trunc_width = 75 })
    local location = H.section_location({ trunc_width = 75 })
    local codecompanion = H.section_codecompanion({ trunc_width = 75 })

    return mini_statusline.combine_groups({
      { hl = mode_hl, strings = { mode } },
      { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
      "%<", -- Mark general truncate point
      { hl = "MiniStatuslineInactive" },
      "%=", -- End left alignment
      { hl = "MiniStatuslineFileinfo", strings = { codecompanion, clients, fileinfo, filesize } },
      { hl = mode_hl, strings = { location } },
    })
  end

  -- winbar
  local winbar = mini_statusline.combine_groups({
    { strings = { H.secion_filepath } },
  })
  vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufWinEnter", "BufFilePost" }, {
    pattern = "*",
    group = vim.api.nvim_create_augroup("maybe_enable_winbar", { clear = true }),
    callback = function(ctx)
      if buffer.excluded(ctx.buf) then
        vim.wo.winbar = nil
        return
      end
      if vim.fn.empty(vim.wo.winbar) == 0 then
        return
      end

      vim.wo.winbar = winbar
    end,
  })

  mini_statusline.setup({
    content = {
      active = H.content_active,
    },
    set_vim_settings = false,
  })
end)
