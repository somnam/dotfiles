local M = {}

M.into_shell = function(command)
  return table.concat(M.into_table(command), " ")
end

M.into_table = function(command)
  return vim.list_extend((command.cmd and { command.cmd } or {}), command.args or {})
end

M.executable = function(cmd)
  return cmd and vim.fn.executable(cmd) == 1 or false
end

---@param command table
---@param opts table
---@return (string|table)
M.command_from_opts = function(command, opts)
  opts = opts or {}

  if opts.cmd_only then
    return command.cmd
  end

  if opts.args_only then
    command.cmd = nil
  end

  if opts.into_shell then
    return M.into_shell(command)
  elseif opts.into_table then
    return M.into_table(command)
  end

  return command
end

---@return table
M.get_find_command = function(_)
  local fd = {
    cmd = "fd",
    args = {
      "--color=never",
      "--type=f",
      "--hidden",
      "--follow",
      "--no-require-git",
      "--exclude=.git",
    },
  }
  if M.executable(fd.cmd) then
    return fd
  end

  local rg = {
    cmd = "rg",
    args = {
      "--color=never",
      "--files",
      "--hidden",
      "--follow",
      "--no-require-git",
      "--glob=!.git",
    },
  }
  if M.executable(rg.cmd) then
    return rg
  end

  return {
    cmd = "find",
    args = {
      "-L",
      ".",
      "-type",
      "f",
      "-not",
      "-path",
      "'*/.git/*'",
      "-and",
      "-not",
      "-path",
      "'*/__pycache__/*'",
    },
  }
end

---@param opts table
---@return table
M.get_grep_command = function(opts)
  opts = opts or {}
  local rg = {
    cmd = "rg",
    args = {
      "--column",
      "--line-number",
      "--no-heading",
      opts.color and "--color=always" or "--color=never",
      "--smart-case",
      "--hidden",
      "--follow",
      "--no-require-git",
      "--max-columns=4096",
      "--glob=!.git",
    },
  }
  if M.executable(rg.cmd) then
    return rg
  end

  return {
    cmd = "grep",
    args = {
      "--byte-offset",
      "--binary-files=without-match",
      "--line-number",
      "--recursive",
      "--extended-regexp",
      "--ignore-case",
      "--no-messages",
      opts.color and "--color=always" or "--color=never",
      "--exclude-dir=.git",
    },
  }
end

---@param opts table
---@return (string|table)
M.find = function(opts)
  return M.command_from_opts(M.get_find_command(opts), opts)
end

---@param opts table
---@return (string|table)
M.grep = function(opts)
  return M.command_from_opts(M.get_grep_command(opts), opts)
end

return M
