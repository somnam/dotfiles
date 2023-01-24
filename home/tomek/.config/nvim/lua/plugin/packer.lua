local P = {"wbthomason/packer.nvim"}

P.config = function()
  -- autocmd
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/nvim/lua/plugin/init.lua",
    group = vim.api.nvim_create_augroup("packer_auto_source", { clear = true }),
    callback = function(ctx)
      vim.cmd("source " .. ctx.file)
    end
  })
end

return P
