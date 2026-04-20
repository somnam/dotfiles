Config.now(function()
  vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
  local file = require("util.file")
  local tool = require("util.tool")

  ---@param args table
  local function section_tools(args)
    local tools_count = tool.get_count()
    if tools_count == 0 then
      return ""
    end

    if MiniStatusline.is_truncated(args.trunc_width) then
      return string.format("%s %s", args.icon, tools_count)
    end

    return string.format("%s %s", args.icon, table.concat(tool.get_names(), " "))
  end

  ---@param args table
  local function section_fileinfo(args)
    local filetype = vim.bo.filetype
    if filetype == "" then
      return ""
    end

    if MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
      return string.format("%s %s", args.icon, filetype)
    end

    local format = vim.bo.fileformat
    return string.format("%s %s %s", args.icon, filetype, format)
  end

  ---@param args table
  local function section_filesize(args)
    if
      MiniStatusline.is_truncated(args.trunc_width)
      or vim.bo.filetype == ""
      or vim.bo.buftype ~= ""
    then
      return ""
    end

    local size = file.current_file_size()
    return size and string.format("%s %s", args.icon, size) or ""
  end

  local function section_location(args)
    if MiniStatusline.is_truncated(args.trunc_width) then
      return "%3l:%-2c"
    end

    return "%3l:%-2c %P"
  end

  ---@param args table
  local function section_git(args)
    local summary = vim.b.minigit_summary_string or vim.b.gitsigns_head
    if MiniStatusline.is_truncated(args.trunc_width) or summary == nil then
      return ""
    end

    summary = summary == "" and "-" or summary:gsub("^%w+/", "")

    if args.shorten_width and vim.fn.strchars(summary) > args.shorten_width then
      summary = vim.fn.strcharpart(summary, 0, args.shorten_width) .. "…"
    end

    return (args.icon or "Git") .. " " .. summary
  end

  ---@param args table
  local function section_filename(args)
    if vim.tbl_contains({ "nofile", "prompt" }, vim.bo.buftype) then
      return ""
    end
    return MiniStatusline.section_filename(args)
  end

  local function section_codecompanion_wrapper()
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
        state.timer = vim.uv.new_timer()
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
      group = vim.api.nvim_create_augroup("code_companion_status_line", { clear = true }),
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
      return MiniStatusline.is_truncated(args.trunc_width) and spinner
        or string.format("%s waiting", spinner)
    end

    return section_codecompanion
  end

  local section_codecompanion = section_codecompanion_wrapper()

  -- statusline
  local function content_active()
    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
    local git = section_git({ icon = "", trunc_width = 75, shorten_width = 10 })
    local diff = MiniStatusline.section_diff({ icon = "𝚫", trunc_width = 75 })
    local diagnostics = MiniStatusline.section_diagnostics({
      icon = "⚑",
      trunc_width = 75,
      signs = { ERROR = "E:", WARN = "W:", INFO = "I:", HINT = "H:" },
    })
    local filename = section_filename({ trunc_width = 220 })
    local codecompanion = section_codecompanion({ trunc_width = 75 })
    local tools = section_tools({ icon = "🛠", trunc_width = 160 })
    local fileinfo = section_fileinfo({ icon = "≋", trunc_width = 120 })
    local filesize = section_filesize({ icon = "◔", trunc_width = 120 })
    local location = section_location({ trunc_width = 75 })

    return MiniStatusline.combine_groups({
      { hl = mode_hl, strings = { mode } },
      { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
      "%<", -- Mark general truncate point
      { hl = "MiniStatuslineFilename", strings = { filename } },
      "%=", -- End left alignment
      { hl = "MiniStatuslineFileinfo", strings = { codecompanion, tools, fileinfo, filesize } },
      { hl = mode_hl, strings = { location } },
    })
  end

  local function content_inactive() return "%#MiniStatuslineInactive#%f %m %r%=" end

  require("mini.statusline").setup({
    content = {
      active = content_active,
      inactive = content_inactive,
    },
    set_vim_settings = false,
  })
end)
