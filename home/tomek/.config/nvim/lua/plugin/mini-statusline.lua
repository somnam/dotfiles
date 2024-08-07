local buffer = require("core.buffer")
local clients = require("util.clients")
local file = require("util.file")

return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  init = function()
    local mini_statusline = require("mini.statusline")

    local H = {}

    H.section_diff = function(args)
      local summary = vim.b.minidiff_summary_string or vim.b.gitsigns_status or ""
      if #summary == 0 then
        return ""
      end

      return mini_statusline.section_diff(args)
    end

    H.section_updates = function(args)
      local plugin_updates = require("lazy.status").has_updates()
      if not plugin_updates then
        return ""
      end

      local updated_plugins = #require("lazy.manage.checker").updated

      if mini_statusline.is_truncated(args.trunc_width) then
        return string.format("%s %d", args.icon, updated_plugins)
      end

      local plugins_suffix = updated_plugins > 1 and "plugins" or "plugin"
      return string.format("%s %d %s", args.icon, updated_plugins, plugins_suffix)
    end

    ---@param args table
    H.section_clients = function(args)
      if not clients.has_clients() then
        return ""
      end

      if mini_statusline.is_truncated(args.trunc_width) then
        return string.format("%s %d", args.icon, clients.get_clients_count())
      end

      return string.format("%s %s", args.icon, clients.get_clients_string())
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
      local size = file.current_file_size()

      return string.format("%s %s %s %s", args.icon, filetype, size, format)
    end

    ---@param args table
    H.section_filename = function(args)
      if buffer.filetype_excluded() then
        return ""
      end

      return mini_statusline.section_filename(args)
    end

    H.section_location = "%3l:%-2c %P"

    H.secion_filepath = "%f %m %r"

    -- statusline
    H.content_active = function()
      local mode, mode_hl = mini_statusline.section_mode({})
      local git = mini_statusline.section_git({ icon = "" })
      local diff = H.section_diff({ icon = "𝚫" })
      local diagnostics = mini_statusline.section_diagnostics({
        icon = "",
        signs = { ERROR = "✖ ", WARN = "▲ ", INFO = "● ", HINT = "⚑ " },
      })
      local updates = H.section_updates({ icon = "↓", trunc_width = 120 })
      local clients = H.section_clients({ icon = "●", trunc_width = 120 })
      local fileinfo = H.section_fileinfo({ icon = "𝌆", trunc_width = 75 })

      return mini_statusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
        "%<", -- Mark general truncate point
        { hl = "MiniStatuslineInactive" },
        "%=", -- End left alignment
        { strings = { updates } },
        { hl = "MiniStatuslineFileinfo", strings = { clients, fileinfo } },
        { hl = mode_hl, strings = { H.section_location } },
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

        vim.wo.winbar = winbar
      end,
    })

    mini_statusline.setup({
      content = {
        active = H.content_active,
      },
      set_vim_settings = false,
    })
  end,
}
