local available_cursorword, cursorword = pcall(require, "mini.cursorword")
if available_cursorword then
  local buffer = require("util.buffer")

  local function mini_cursorword_disable()
    vim.b.minicursorword_disable = true
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = table.concat(buffer.exclude.filetype, ","),
    group = vim.api.nvim_create_augroup("mini_cursorword_file_disable", { clear = true }),
    callback = mini_cursorword_disable,
  })

  cursorword.setup({delay = 150})
end
