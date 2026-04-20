return {
  init_options = {
    logLevel = "error",
  },
  settings = {
    ty = {
      completions = {
        autoImport = true,
      },
      diagnosticMode = "openFilesOnly",
      disableLanguageServices = false,
      inlayHints = {
        callArgumentNames = true,
        variableTypes = true,
      },
    },
  },
}
