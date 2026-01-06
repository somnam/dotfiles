local buffer = require("util.buffer")
local now = require("mini.deps").now

now(function()
  vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup(
      "maybe_disable_mini_completion_buffer_size",
      { clear = true }
    ),
    callback = function(ctx)
      if buffer.above_max_size(ctx.buf) then
        vim.b.minicompletion_disable = true
      end
    end,
  })
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup(
      "maybe_disable_mini_completion_buffer_excluded",
      { clear = true }
    ),
    callback = function(ctx)
      if buffer.excluded(ctx.buf) then
        vim.b.minicompletion_disable = true
      end
    end,
  })

  local mini_completion = require("mini.completion")
  mini_completion.setup({
    set_vim_settings = false,
    delay = { completion = 100, info = 200, signature = -1 },
    window = {
      info = { border = "none" },
      signature = { border = "none" },
    },
  })
end)
