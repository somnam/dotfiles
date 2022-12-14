local function highlight_yank()
  vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
      vim.highlight.on_yank({higroup = "IncSearch", timeout = 300})
    end,
  })
end


local function autoresize_widows()
  vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("autoresize_widows", { clear = true }),
    command = "wincmd =",
  })
end


local function true_color_term()
  return vim.env.COLORTERM == "truecolor"
end


local function enable_termguicolors()
  vim.go.termguicolors = true
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
    group = vim.api.nvim_create_augroup("set_codedark_theme", { clear = true }),
    callback = function()
      vim.api.nvim_set_hl(0, "GitSignsAdd", {ctermbg=none, ctermfg=65, bg=none, fg="#4B5632"})
      vim.api.nvim_set_hl(0, "GitSignsChange", {ctermbg=none, ctermfg=75, bg=none, fg="#005f87"})
      vim.api.nvim_set_hl(0, "GitSignsDelete", {ctermbg=none, ctermfg=167, bg=none, fg="#6F1313"})
    end
  })

  vim.cmd("silent! colorscheme codedark")
end

local function set_fzf_lua_hl()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern="*",
    group = vim.api.nvim_create_augroup("set_fzf_lua_hl", { clear = true }),
    callback = function()
      vim.api.nvim_set_hl(0, 'FzfLuaNormal', {nocombine = true})
      vim.api.nvim_set_hl(0, "FzfLuaBorder", {nocombine = true})
    end
  })
end

local function set_true_color_theme()
  set_vscode_theme()
end

local function set_256_color_theme()
  set_codedark_theme()
end

local function set_default_color_theme()
    vim.cmd("colorscheme default")
end

local function set_theme()
  set_fzf_lua_hl()
  set_default_color_theme()

  if true_color_term() then
    enable_termguicolors()
    set_true_color_theme()
  else
    set_256_color_theme()
  end
end

highlight_yank()
autoresize_widows()
set_theme()
