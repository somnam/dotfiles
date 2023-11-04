return {
  "ray-x/lsp_signature.nvim",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local lsp_signature = require("lsp_signature")

    lsp_signature.setup({
      close_timeout = 2000,
      handler_opts = {
        border = "rounded"
      },
      hint_enable = false,
      toggle_key = "<C-k>",
    })
  end
}
