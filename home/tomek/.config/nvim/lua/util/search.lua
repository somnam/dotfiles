local command = require("util.command")

local M = {}

M.get_find_command = function()
  local rg = {
    cmd = "rg",
    args = {
      "--color=never",
      "--files",
      "--follow",
      "-g '!__pycache__'",
    }
  }
  if command.executable(rg.cmd) then
    return rg
  end

  return {
    cmd = "find",
    args = {
      "-L",
      ".",
      "-type f",
      "-not", "-path", "'*/.*'",
      "-and", "-not", "-path", "'*/__pycache__/*'",
    }
  }
end

M.get_grep_command = function()
  local rg = {
    cmd = "rg",
    args = {
      "--column",
      "--line-number",
      "--no-heading",
      "--color=always",
      "--smart-case",
      "--max-columns=4096",
    }
  }
  if command.executable(rg.cmd) then
    return rg
  end

  local ack = {
    cmd = "ack",
    args = {
      "--nocolor",
      "--nogroup",
      "--column",
      "--smart-case",
      "--ignore-dir={.cache,.mypy_cache,.pytest_cache}",
      "--ignore-dir={.env,.venv}",
    }
  }
  if command.executable(ack.cmd) then
    return ack
  end

  return {
    cmd = "grep",
    args = {
      "--binary-files=without-match",
      "--line-number",
      "--recursive",
      "--color=never",
      "--perl-regexp",
      "--exclude-dir='.*'",
    }
  }
end

M.find = function()
  local find = M.get_find_command()
  return command.into_shell(find.cmd, find.args)
end

M.grep = function()
  local grep = M.get_grep_command()
  return command.into_shell(grep.cmd, grep.args)
end

return M
