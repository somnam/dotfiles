return {
  "stevearc/oil.nvim",
  event = "VimEnter",
  keys = {
    {
      "<Space>e",
      function()
        require("oil").toggle_float()
      end,
      noremap = true,
      silent = true,
      desc = "Open or close the file explorer",
    },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<C-s>"] = {
        "actions.select",
        opts = { horizontal = true },
        desc = "Open the entry in a horizontal split",
      },
      ["<C-v>"] = {
        "actions.select",
        opts = { vertical = true },
        desc = "Open the entry in a vertical split",
      },
      ["<C-[>"] = "actions.close",
    },
    float = {
      max_width = 120,
      max_height = 60,
    },
  },
}
