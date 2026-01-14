local now = require("mini.deps").now

now(
  function()
    require("mini.notify").setup({
      lsp_progress = { duration_last = 2000 },
    })
  end
)
