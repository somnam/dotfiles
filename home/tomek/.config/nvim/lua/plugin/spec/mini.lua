return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
    local buffer = require("util.buffer")

    local H = {}

    H.exclude_filetype = buffer.exclude.filetype

    H.max_size = 1024 * 256

    H.maybe_disable_mini_cursorword = function(ctx)
      return (
        vim.tbl_contains(H.exclude_filetype, ctx.match)
        or buffer.above_max_size(ctx.buf, H.max_size)
      )
    end

    local mini_bufremove = require("mini.bufremove")
    vim.api.nvim_cmd({
      cmd = "command",
      args = {"BD lua MiniBufremove.delete(0, true)"},
      bang = true,
    }, {})
    vim.api.nvim_cmd({
      cmd = "command",
      args = {"BW lua MiniBufremove.wipeout(0, true)"},
      bang = true,
    }, {})
    mini_bufremove.setup()

    local mini_comment = require("mini.comment")
    mini_comment.setup()

    local mini_pairs = require("mini.pairs")
    local neigh_pattern = ".[%s%)%]%}]"
    local quote_neigh_pattern = "[%{%[%(%=%s][%s%)%]%}]"
    mini_pairs.setup({
      mappings = {
        ["("] = { neigh_pattern = neigh_pattern },
        ["["] = { neigh_pattern = neigh_pattern },
        ["{"] = { neigh_pattern = neigh_pattern },
        ['"'] = { action = "open", neigh_pattern = quote_neigh_pattern },
        ["'"] = { action = "open", neigh_pattern = quote_neigh_pattern },
        ["`"] = { action = "open", neigh_pattern = quote_neigh_pattern },
      }
    })

    local mini_trailspace = require("mini.trailspace")
    mini_trailspace.setup()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("mini_cursorword_file_disable", { clear = true }),
      callback = function(ctx)
        if H.maybe_disable_mini_cursorword(ctx) then
          vim.b.minicursorword_disable = true
        end
      end
    })

    local mini_cursorword = require("mini.cursorword")
    mini_cursorword.setup({delay = 150})

    local mini_clue = require("mini.clue")
    mini_clue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Space>' },
        { mode = 'x', keys = '<Space>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
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
          col = "auto"
        }
      }
    })
  end
}
