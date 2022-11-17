local available, dashboard = pcall(require, "dashboard")
if not available then return end

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

dashboard.hide_statusline = false

dashboard.custom_header = {
  string.format(" %s ", header_padding()),
  string.format(" = %s = ", nvim_version()),
  string.format(" %s ", header_padding()),
}

dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Previous files                  ",
    action = "Telescope oldfiles",
    shortcut = "<Space>fp"
  },
  {
    icon = "  ",
    desc = "Find files                      ",
    action = "Telescope find_files",
    shortcut = "<Space>ff"
  },
  {
    icon = "  ",
    desc = "Find changed files              ",
    action = "Telescope git_status",
    shortcut = "<Space>fg"
  },
  {
    icon = "  ",
    desc = "Find in files                   ",
    action = "Telescope live_grep",
    shortcut = "<Space>fw"
  },
  {
    icon = "  ",
    desc = "File browser                    ",
    action = "Telescope file_browser",
    shortcut = "<Space>fb"
  },
  {
    icon = "  ",
    desc = "New file                        ",
    action = "enew",
    shortcut = "<Space>n "
  },
  {
    icon = "  ",
    desc = "Quit                            ",
    action = "qall",
    shortcut = "<Space>q "
  },
}
