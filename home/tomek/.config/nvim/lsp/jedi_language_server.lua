return {
  init_options = {
    completion = {
      disableSnippets = true,
    },
    workspace = {
      environmentPath = vim.env.VIRTUAL_ENV,
    },
  },
  on_attach = function(client, bufnr)
    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters = { "." }
  end,
}
