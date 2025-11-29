return {
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "off",
        useLibraryCodeForTypes = true,
        logLevel = "Error",
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters = { "." }
  end,
}
