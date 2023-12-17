local buffer = require("util.buffer")

return {
  "nmac427/guess-indent.nvim",
  event = {"BufReadPost", "BufNewFile"},
  opts = {
    auto_cmd = true,
    -- A list of filetypes for which the auto command gets disabled
    filetype_exclude = buffer.exclude.filetype,
    -- A list of buffer types for which the auto command gets disabled
    buftype_exclude = buffer.exclude.buftype,
  }
}
