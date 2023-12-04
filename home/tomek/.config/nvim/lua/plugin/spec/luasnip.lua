return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "echo 'NOTE: jsregexp is optional\n'; make install_jsregexp",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local luasnip = require("luasnip")

    -- setup
    luasnip.setup({})

    for _, type in pairs({"vscode", "snipmate", "lua"}) do
      require("luasnip.loaders.from_" .. type).lazy_load()
    end
  end
}
