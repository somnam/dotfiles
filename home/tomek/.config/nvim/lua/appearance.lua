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

M.set_colorscheme = function(colorscheme)
  local cmd = string.format(
    [[
      hi clear
      syntax reset
      colorscheme %s
    ]],
    colorscheme
  )
  vim.cmd(cmd)
end

M.setup = function(config)
  config = vim.tbl_extend("keep", config or {}, M.defaults)

  if M.true_color_term() then
    vim.go.termguicolors = true
    M.set_colorscheme(config.truecolor_colorscheme)
  else
    vim.go.termguicolors = false
    M.set_colorscheme(config.colorscheme)
  end
end

return M
