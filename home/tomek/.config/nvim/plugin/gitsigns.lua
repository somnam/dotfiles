if vim.fn.executable("git") ~= 1 then
  vim.notify("git not installed; gitsigns plugin skipped.", vim.log.levels.WARN)
  return
end

local add = require("mini.deps").add
local later = require("mini.deps").later

later(function()
  add({ source = "lewis6991/gitsigns.nvim" })

  local function on_attach(bufnr)
    local bufopts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<leader>gd",
      ":Gitsigns diffthis<Enter>",
      vim.tbl_extend("keep", { desc = "Show buffer diff against the git index" }, bufopts)
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<leader>gb",
      ":Gitsigns blame_line<Enter>",
      vim.tbl_extend(
        "keep",
        { desc = "Show blame annotation at the end of current line." },
        bufopts
      )
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "[g",
      ":Gitsigns prev_hunk<Enter>",
      vim.tbl_extend("keep", { desc = "Go to previous git change block" }, bufopts)
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "]g",
      ":Gitsigns next_hunk<Enter>",
      vim.tbl_extend("keep", { desc = "Go to next git change block" }, bufopts)
    )
  end

  require("gitsigns").setup({
    signs = {
      delete = { show_count = true },
      topdelete = { show_count = true },
      changedelete = { show_count = true },
    },
    on_attach = on_attach,
    current_line_blame_formatter = "<author> (<author_time:%Y-%m-%d>) <abbrev_sha>: <summary>",
    update_debounce = 1000,
  })
end)
