return {
  settings = {
    Lua = {
      completion = {
        showWord = "Disable",
      },
      diagnostics = {
        enable = true,
        unusedLocalExclude = { "_*" },
        -- Disable workspace diagnostics
        workspaceDelay = -1,
        workspaceEvent = "None",
      },
      hint = {
        arrayIndex = "Disable",
        enable = true,
        setType = true,
      },
      runtime = {
        path = vim.split(package.path, ";"),
        version = "LuaJIT",
      },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        maxPreload = 1000,
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Customize trigger characters.
    client.server_capabilities.completionProvider.triggerCharacters =
      { ".", ":", ",", "#", "*", "@", "|", "?" }
  end,
}
