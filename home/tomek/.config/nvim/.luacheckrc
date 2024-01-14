-- Rerun tests only if their modification time changed.
cache = true

ignore = {
  "121", -- setting read-only global variable 'vim'
  "122", -- setting read-only field of global variable 'vim'
}

-- Global objects defined by the nvim code
read_globals = {
  "vim",
}

globals = {
  "vim.g",
  "vim.b",
  "vim.w",
  "vim.o",
  "vim.bo",
  "vim.wo",
  "vim.go",
  "vim.env"
}
