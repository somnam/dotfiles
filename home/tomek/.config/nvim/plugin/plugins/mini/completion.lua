local buffer = require("util.buffer")

MiniDeps.now(function()
  vim.api.nvim_create_autocmd({ "BufReadPost", "FileType" }, {
    group = vim.api.nvim_create_augroup("maybe_disable_mini_completion", { clear = true }),
    callback = function(ctx)
      if buffer.excluded_or_above_max_size(ctx.buf) then
        vim.b.minicompletion_disable = true
      end
    end,
  })

  require("mini.completion").setup({
    set_vim_settings = false,
    delay = { completion = 100, info = 200, signature = -1 },
    window = {
      info = { border = "none" },
      signature = { border = "none" },
    },
  })
end)
