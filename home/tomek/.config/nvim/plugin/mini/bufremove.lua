local later = require("mini.deps").later

later(function()
  local mini_bufremove = require("mini.bufremove")
  mini_bufremove.setup()
  vim.api.nvim_create_user_command("BD", function() mini_bufremove.delete(0, true) end, {})
  vim.api.nvim_create_user_command("BW", function() mini_bufremove.wipeout(0, true) end, {})
end)
