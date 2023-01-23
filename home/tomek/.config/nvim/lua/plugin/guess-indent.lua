local P = {"nmac427/guess-indent.nvim"}

P.config = function()
  local guess_indent = require("guess-indent")

  -- setup
  guess_indent.setup({
    auto_cmd = true,
    -- A list of filetypes for which the auto command gets disabled
    filetype_exclude = {"netrw", "tutor"},
    -- A list of buffer types for which the auto command gets disabled
    buftype_exclude = {"help", "nofile", "terminal", "prompt", "alpha"},
  })
end

return P
