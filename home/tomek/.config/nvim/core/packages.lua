-- Enable optional packages
vim.cmd("packadd matchit")

vim.cmd("silent! packadd nvim.undotree")
if pcall(require, "undotree") then
  vim.keymap.set("n", "<leader>u", require("undotree").open, { noremap = true, silent = true })
end
