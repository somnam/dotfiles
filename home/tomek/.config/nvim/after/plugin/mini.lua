local available_cursorword, cursorword = pcall(require, "mini.cursorword")
if available_cursorword then
  local buffer = require("util.buffer")

  local H = {}

  H.exclude_filetype = vim.list_extend(
    {"json", "yaml"},
    buffer.exclude.filetype
  )

  H.maybe_disable_mini_cursorword = function(ctx)
    if vim.tbl_contains(H.exclude_filetype, ctx.match) then
      vim.b.minicursorword_disable = true
    end
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("mini_cursorword_file_disable", { clear = true }),
    callback = H.maybe_disable_mini_cursorword,
  })

  cursorword.setup({delay = 150})
end
