return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
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

    require("mini.notify").setup({
      lsp_progress = { duration_last = 2000 },
    })
  end,
}
