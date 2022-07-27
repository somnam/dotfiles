-- Set local python path
local python_cmd = vim.fn.stdpath("data") .. "/python/bin/python"
if vim.fn.executable(python_cmd) == 1 then
    vim.g.python3_host_prog = python_cmd
end
