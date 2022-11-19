local function true_color_term()
  return vim.env.COLORTERM == "truecolor"
end

local function set_vscode_theme()
  local available, vscode = pcall(require, "vscode")
  if not available then return end

  vscode.setup({
    group_overrides = {
      CursorLine = {bg="#282828"},
    }
  })
end

local function set_codedark_theme()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern="codedark",
    callback = function()
      vim.api.nvim_set_hl(0, "GitSignsAdd", {ctermbg=none, ctermfg=65, bg=none, fg="#4B5632"})
      vim.api.nvim_set_hl(0, "GitSignsChange", {ctermbg=none, ctermfg=75, bg=none, fg="#005f87"})
      vim.api.nvim_set_hl(0, "GitSignsDelete", {ctermbg=none, ctermfg=167, bg=none, fg="#6F1313"})
    end
  })

  vim.cmd("silent! colorscheme codedark")
end

local function set_true_color_theme()
  set_vscode_theme()
end

local function set_256_color_theme()
  set_codedark_theme()
end

if true_color_term() then
  set_true_color_theme()
else
  set_256_color_theme()
end
