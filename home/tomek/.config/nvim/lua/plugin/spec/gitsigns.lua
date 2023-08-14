local P = {"lewis6991/gitsigns.nvim"}

P.event = {"BufReadPre", "BufNewFile"}

P.config = function()
  local gitsigns = require("gitsigns")

  local H = {}

  H.on_attach = function(bufnr)
    -- keymap
    local bufopts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n", "<Space>gd", ":Gitsigns diffthis<Enter>",
      vim.tbl_extend("keep", {desc = "Show buffer diff against the git index"}, bufopts)
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n", "<Space>[g", ":Gitsigns prev_hunk<Enter>",
      vim.tbl_extend("keep", {desc = "Go to previous git change block"}, bufopts)
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n", "<Space>]g", ":Gitsigns next_hunk<Enter>",
      vim.tbl_extend("keep", {desc = "Go to next git change block"}, bufopts)
    )
  end

  -- setup
  gitsigns.setup({
    signs = {
      delete       = {show_count = true},
      topdelete    = {show_count = true},
      changedelete = {show_count = true},
    },
    on_attach = H.on_attach,
    current_line_blame = true,
    current_line_blame_formatter = "<author> (<author_time:%Y-%m-%d>) <abbrev_sha>: <summary>",
    update_debounce = 1000,
  })
end

return P
