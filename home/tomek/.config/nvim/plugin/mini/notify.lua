local later = require("mini.deps").later

later(
  function()
    require("mini.notify").setup({
      lsp_progress = { duration_last = 2000 },
    })
  end
)
