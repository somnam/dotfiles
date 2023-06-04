local available_cursorword, cursorword = pcall(require, "mini.cursorword")
if available_cursorword then
  local buffer = require("util.buffer")

  local H = {}

  H.exclude_filetype = buffer.exclude.filetype

  H.max_size = buffer.max_size

  H.maybe_disable_mini_cursorword = function(ctx)
    return (
      vim.tbl_contains(H.exclude_filetype, ctx.match)
      or buffer.above_max_size(ctx.buf, H.max_size)
    )
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("mini_cursorword_file_disable", { clear = true }),
    callback = function(ctx)
      if H.maybe_disable_mini_cursorword(ctx) then
        vim.b.minicursorword_disable = true
      end
    end
  })

  cursorword.setup({delay = 150})
end
