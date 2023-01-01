vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({higroup = "IncSearch", timeout = 300})
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("autoresize_widows", { clear = true }),
  command = "wincmd =",
})

local M = {
  defaults = {
    colorscheme = "default",
    truecolor_colorscheme = "default",
  }
}

M.true_color_term = function()
  return vim.env.COLORTERM == "truecolor"
end

M.setup = function(config)
  config = vim.tbl_extend("keep", config or {}, M.defaults)

  if M.true_color_term() then
    vim.go.termguicolors = true
    vim.cmd("colorscheme " .. config.truecolor_colorscheme)
  else
    vim.cmd("colorscheme " .. config.colorscheme)
  end
end

return M
