local M = {}

M.has_cmd = function(cmd)
  return vim.fn.executable(cmd) == 1
end

M.cmd = function(cmd_and_args)
  return table.concat(cmd_and_args, " ")
end

M.find_args = function()
  if M.has_cmd("rg") then
    return {
      "rg",
      "--color=never",
      "--files",
      "--hidden",
      "--follow",
      "-g '!{.git,__pycache__}'",
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
  return M.cmd(M.find_args())
end

M.grep_args = function()
  if M.has_cmd("rg") then
    return {
      "rg",
      "--column",
      "--line-number",
      "--no-heading",
      "--color=always",
      "--smart-case",
      "--max-columns=4096",
    }
  end

  if M.has_cmd("ack") then
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
  return M.cmd(M.grep_args())
end

return M
