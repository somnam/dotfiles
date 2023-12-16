local config = vim.fn.stdpath("config") .. "/.config.json"

return require('util.misc').map_extend(
  {
      colorscheme = "default"
  },
  require('util.file').read_json_file(config)
)
