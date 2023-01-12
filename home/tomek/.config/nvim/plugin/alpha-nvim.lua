local available, alpha = pcall(require, "alpha")
if not available then return end

local dashboard = require("alpha.themes.dashboard")

local function nvim_version()
  local version = vim.version()

  return string.format(
    "v%d.%d.%d %s",
    version.major, version.minor, version.patch,
    jit.version
  )
end

local function header_padding(pad)
  pad = pad ~= nil and pad or 4
  repeats = string.len(nvim_version()) + pad
  return string.rep("=", repeats)
end

dashboard.section.header.val = {
  string.format(" %s ", header_padding()),
  string.format(" = %s = ", nvim_version()),
  string.format(" %s ", header_padding()),
}

dashboard.section.buttons.val = {
    dashboard.button("<Leader> p ", "▶ Previous files" , ":FzfLua oldfiles cwd_only=True<Enter>"),
    dashboard.button("<Leader> f ", "▶ Find files", ":FzfLua files<Enter>"),
    dashboard.button("<Leader> w ", "▶ Find in files", ":FzfLua live_grep<Enter>"),
    dashboard.button("<Leader> n ", "▶ New file" , ":enew<Enter>"),
    dashboard.button("<Leader> q ", "▶ Quit", ":qa<Enter>"),
}

alpha.setup(dashboard.opts)

vim.cmd("autocmd FileType alpha setlocal nofoldenable")
