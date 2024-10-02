return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
    local mini_bufremove = require("mini.bufremove")
    mini_bufremove.setup()
    vim.api.nvim_create_user_command("BD", function()
      mini_bufremove.delete(0, true)
    end, {})
    vim.api.nvim_create_user_command("BW", function()
      mini_bufremove.wipeout(0, true)
    end, {})

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
