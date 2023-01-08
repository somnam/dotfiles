local M = {}

local function has_cmd(cmd)
  return vim.fn.executable(cmd) == 1
end

function cmd(cmd_and_args)
  return table.concat(cmd_and_args, " ")
end

local function in_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
  return vim.v.shell_error == 0
end

M.find_cmd = function()
  if has_cmd("fd") then
    return cmd({
      "fd",
      "--type=file",
      "--type=symlink",
      "--color=never",
    })
  end

  return cmd({
    "find",
    "-L",
    ".",
    "-type f",
    "-not", "-path", "'*/.*'",
  })
end

M.grep_cmd = function()
  if has_cmd("ack") then
    if in_git_repo() then
      return cmd({
        "git",
        "ls-files",
        "--others",
        "--cached",
        "--exclude-standard",
        "|",
        "ack",
        "--nocolor",
        "--column",
        "--smart-case",
        "--files-from=-",
      })
    else
      return cmd({
        "ack",
        "--nocolor",
        "--column",
        "--smart-case",
        "--ignore-dir={.cache,.mypy_cache,.pytest_cache}",
        "--ignore-dir={.env,.venv}",
      })
    end
  end

  return cmd({
    "grep",
    "--binary-files=without-match",
    "--line-number",
    "--recursive",
    "--color=never",
    "--perl-regexp",
    "--exclude-dir='.*'",
  })
end

return M
