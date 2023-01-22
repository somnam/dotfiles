local M = {}

M.defaults = {
  colorscheme = "default",
  truecolor_colorscheme = "default",
}

local function autocmd()
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

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern="*",
    group = vim.api.nvim_create_augroup("after_colorscheme", { clear = true }),
    callback = function()
      vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal" })
    end
  })
end

local function colorscheme_cmd(colorscheme)
  vim.cmd(
    string.format(
      [[
        hi clear
        syntax reset
        silent! colorscheme %s
      ]],
      colorscheme
    )
  )
end

M.true_color_term = function()
  return vim.env.COLORTERM == "truecolor"
end

M.set_colorscheme = function(colorscheme)
  vim.go.termguicolors = false
  colorscheme_cmd(colorscheme)
end

M.set_truecolor_colorscheme = function(truecolor_colorscheme)
  vim.go.termguicolors = true
  colorscheme_cmd(truecolor_colorscheme)
end

M.setup = function(config)
  autocmd()

  config = vim.tbl_extend("keep", config or {}, M.defaults)

  if M.true_color_term() then
    M.set_truecolor_colorscheme(config.truecolor_colorscheme)
  else
    M.set_colorscheme(config.colorscheme)
  end
end

return M
