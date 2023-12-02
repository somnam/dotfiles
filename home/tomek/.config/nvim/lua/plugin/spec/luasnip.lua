return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "echo 'NOTE: jsregexp is optional\n'; make install_jsregexp",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local luasnip = require("luasnip")

    local H = {}

    H.feedkeys = function(key, mode)
        mode = mode or "n"
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode)
    end

    H.expand_or_jump_callback = function(fallback)
      return function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif not luasnip.in_snippet() then
          H.feedkeys(fallback)
        end
      end
    end

    H.jump_back_callback = function(fallback)
      return function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        elseif not luasnip.in_snippet() then
          H.feedkeys(fallback)
        end
      end
    end

    -- keymap
    local opts = {noremap = true, silent = true}
    for _, mode in pairs({"i", "s"}) do
      vim.api.nvim_set_keymap(mode, "<C-l>", "", vim.tbl_extend("keep", opts, {
        desc = "Expand or jump in a snippet",
        callback = H.expand_or_jump_callback("<C-l>")
      }))
      vim.api.nvim_set_keymap(mode, "<C-h>", "", vim.tbl_extend("keep", opts, {
        desc = "Jump backwards in a snippet",
        callback = H.jump_back_callback("<C-h>"),
      }))
    end

    -- setup
    luasnip.setup({
      delete_check_events = "TextChanged",
    })

    for _, type in pairs({"vscode", "snipmate", "lua"}) do
      require("luasnip.loaders.from_" .. type).lazy_load()
    end
  end
}
