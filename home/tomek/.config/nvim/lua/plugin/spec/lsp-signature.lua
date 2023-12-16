return {
  "ray-x/lsp_signature.nvim",
  event = {"BufReadPre", "BufNewFile"},
  opts = {
    close_timeout = 2000,
    handler_opts = {
      border = "rounded"
    },
    hint_enable = false,
    toggle_key = "<C-k>",
  }
}
