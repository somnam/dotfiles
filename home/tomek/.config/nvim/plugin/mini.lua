local available_bufremove, bufremove = pcall(require, "mini.bufremove")
if available_bufremove then
  vim.api.nvim_command(":command! BD lua MiniBufremove.delete(0, true)")
  vim.api.nvim_command(":command! BW lua MiniBufremove.wipeout(0, true)")
  bufremove.setup()
end


local available_comment, comment = pcall(require, "mini.comment")
if available_comment then
  comment.setup()
end

local available_cursorword, cursorword = pcall(require, "mini.cursorword")
if available_cursorword then
  cursorword.setup()
end

local available_pairs, pairs = pcall(require, "mini.pairs")
if available_pairs then
  local neigh_pattern = ".[%s%)%]%}]"
  local quote_neigh_pattern = "[%{%[%(%=%s][%s%)%]%}]"
  pairs.setup({
    mappings = {
      ["("] = { neigh_pattern = neigh_pattern },
      ["["] = { neigh_pattern = neigh_pattern },
      ["{"] = { neigh_pattern = neigh_pattern },
      ['"'] = { action = "open", neigh_pattern = quote_neigh_pattern },
      ["'"] = { action = "open", neigh_pattern = quote_neigh_pattern },
      ["`"] = { action = "open", neigh_pattern = quote_neigh_pattern },
    }
  })
end

local available_surround, surround = pcall(require, "mini.surround")
if available_surround then
  surround.setup()
end

local available_trailspace, trailspace = pcall(require, "mini.trailspace")
if available_trailspace then
  trailspace.setup()
end
