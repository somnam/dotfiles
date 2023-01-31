local M = {}

local function has_cmd(cmd)
  return vim.fn.executable(cmd) == 1
end

local function cmd(cmd_and_args)
  return table.concat(cmd_and_args, " ")
end

M.find_args = function()
  if has_cmd("fd") then
    return {
      "fd",
      "--type=file",
      "--type=symlink",
      "--color=never",
      "--hidden",
      "--exclude=__pycache__",
    }
  end

  return {
    "find",
    "-L",
    ".",
    "-type f",
    "-not", "-path", "'*/.*'",
    "-and", "-not", "-path", "'*/__pycache__/*'",
  }
end

M.find_cmd = function()
  return cmd(M.find_args())
end

M.grep_args = function()
  if has_cmd("ack") then
      return {
        "ack",
        "--nocolor",
        "--nogroup",
        "--column",
        "--smart-case",
        "--ignore-dir={.cache,.mypy_cache,.pytest_cache}",
        "--ignore-dir={.env,.venv}",
      }
    end

  return {
    "grep",
    "--binary-files=without-match",
    "--line-number",
    "--recursive",
    "--color=never",
    "--perl-regexp",
    "--exclude-dir='.*'",
  }
end

M.grep_cmd = function()
  return cmd(M.grep_args())
end

return M
