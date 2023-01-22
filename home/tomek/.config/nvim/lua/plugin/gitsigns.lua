local P = {"lewis6991/gitsigns.nvim"}

P.config = function()
  local gitsigns = require("gitsigns")

  local H = {}

  H.on_attach = function(bufnr)
    -- keymap
    local bufopts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>gd", ":Gitsigns diffthis<Enter>", bufopts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>[g", ":Gitsigns prev_hunk<Enter>", bufopts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>]g", ":Gitsigns next_hunk<Enter>", bufopts)
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
