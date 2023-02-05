local P = {"tomasiser/vim-code-dark"}

P.event = "ColorSchemePre coldedark"

P.config = function()
  -- autocmd
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "codedark",
    group = vim.api.nvim_create_augroup("set_codedark_theme", { clear = true }),
    callback = function()
      vim.api.nvim_set_hl(0, "GitSignsAdd", {ctermbg="none", ctermfg=65, bg="none", fg="#4B5632"})
      vim.api.nvim_set_hl(0, "GitSignsChange", {ctermbg="none", ctermfg=75, bg="none", fg="#005f87"})
      vim.api.nvim_set_hl(0, "GitSignsDelete", {ctermbg="none", ctermfg=167, bg="none", fg="#6F1313"})
    end
  })
end

return P
