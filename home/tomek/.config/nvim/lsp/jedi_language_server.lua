local python = require("util.python")

return {
  init_options = {
    completion = {
      disableSnippets = true,
    },
    workspace = {
      environmentPath = python.virtual_env,
    },
  },
  on_attach = function(client, bufnr)
    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters = { "." }
  end,
}
