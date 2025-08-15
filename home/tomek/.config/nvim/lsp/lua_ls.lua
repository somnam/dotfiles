return {
  settings = {
    Lua = {
      completion = {
        showWord = "Disable",
      },
      diagnostics = {
        enable = true,
        -- Only diagnose opened files
        workspaceDelay = -1,
        workspaceEvent = "None",
      },
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      telemetry = { enable = false },
      workspace = {
        maxPreload = 1000,
        checkThirdParty = false,
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters =
      { ".", ":", ",", "#", "*", "@", "|", "?" }
  end,
}
