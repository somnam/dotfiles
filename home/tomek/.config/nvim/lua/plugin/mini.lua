return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  init = function()
    local buffer = require("util.buffer")

    local H = {}

    H.max_size = 1024 * 256

    H.maybe_disable_mini_cursorword = function(ctx)
      return buffer.excluded(ctx.buf) or buffer.above_max_size(ctx.buf, H.max_size)
    end

    H.maybe_disable_mini_indentscope = function(ctx)
      return buffer.excluded(ctx.buf)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("maybe_disable_mini_plugin", { clear = true }),
      callback = function(ctx)
        if H.maybe_disable_mini_cursorword(ctx) then
          vim.b.minicursorword_disable = true
        end
        if H.maybe_disable_mini_indentscope(ctx) then
          vim.b.miniindentscope_disable = true
        end
      end,
    })
  end,
  config = function()
    vim.api.nvim_cmd({
      cmd = "command",
      args = { "BD lua MiniBufremove.delete(0, true)" },
      bang = true,
    }, {})
    vim.api.nvim_cmd({
      cmd = "command",
      args = { "BW lua MiniBufremove.wipeout(0, true)" },
      bang = true,
    }, {})
    require("mini.bufremove").setup()

    require("mini.comment").setup()

    local neigh_pattern = ".[%s%)%]%}]"
    local quote_neigh_pattern = "[%{%[%(%=%s][%s%)%]%}]"
    require("mini.pairs").setup({
      mappings = {
        ["("] = { neigh_pattern = neigh_pattern },
        ["["] = { neigh_pattern = neigh_pattern },
        ["{"] = { neigh_pattern = neigh_pattern },
        ['"'] = { action = "open", neigh_pattern = quote_neigh_pattern },
        ["'"] = { action = "open", neigh_pattern = quote_neigh_pattern },
        ["`"] = { action = "open", neigh_pattern = quote_neigh_pattern },
      },
    })

    require("mini.cursorword").setup({ delay = 150 })

    local mini_clue = require("mini.clue")
    mini_clue.setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Space>" },
        { mode = "x", keys = "<Space>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },
      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.marks(),
        mini_clue.gen_clues.registers(),
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

    local mini_notify = require("mini.notify")
    mini_notify.setup({
      lsp_progress = { duration_last = 2000 },
    })

    require("mini.indentscope").setup({
      symbol = "│",
      options = {
        try_as_border = true,
      },
      draw = {
        delay = 200,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    })
  end,
}
