local H = {}

H.on_attach = function(bufnr)
  local bufopts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<Space>gd",
    ":Gitsigns diffthis<Enter>",
    vim.tbl_extend("keep", { desc = "Show buffer diff against the git index" }, bufopts)
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<Space>gb",
    ":Gitsigns blame_line<Enter>",
    vim.tbl_extend("keep", { desc = "Show blame annotation at the end of current line." }, bufopts)
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

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cond = function()
    return require("util.command").executable("git")
  end,
  opts = {
    signs = {
      delete = { show_count = true },
      topdelete = { show_count = true },
      changedelete = { show_count = true },
    },
    on_attach = H.on_attach,
    current_line_blame_formatter = "<author> (<author_time:%Y-%m-%d>) <abbrev_sha>: <summary>",
    update_debounce = 1000,
  },
}
