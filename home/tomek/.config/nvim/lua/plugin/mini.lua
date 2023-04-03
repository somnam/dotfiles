local P = {"echasnovski/mini.nvim"}

P.config = function()
  local mini_bufremove = require("mini.bufremove")
  vim.api.nvim_cmd({
    cmd = "command",
    args = {"BD lua MiniBufremove.delete(0, true)"},
    bang = true,
  }, {})
  vim.api.nvim_cmd({
    cmd = "command",
    args = {"BW lua MiniBufremove.wipeout(0, true)"},
    bang = true,
  }, {})
  mini_bufremove.setup()

  local mini_comment = require("mini.comment")
  mini_comment.setup()

  local mini_pairs = require("mini.pairs")
  local neigh_pattern = ".[%s%)%]%}]"
  local quote_neigh_pattern = "[%{%[%(%=%s][%s%)%]%}]"
  mini_pairs.setup({
    mappings = {
      ["("] = { neigh_pattern = neigh_pattern },
      ["["] = { neigh_pattern = neigh_pattern },
      ["{"] = { neigh_pattern = neigh_pattern },
      ['"'] = { action = "open", neigh_pattern = quote_neigh_pattern },
      ["'"] = { action = "open", neigh_pattern = quote_neigh_pattern },
      ["`"] = { action = "open", neigh_pattern = quote_neigh_pattern },
    }
  })

  local mini_surround = require("mini.surround")
  mini_surround.setup()

  local mini_trailspace = require("mini.trailspace")
  mini_trailspace.setup()
end

return P
