local later = require("mini.deps").later

later(
  function()
    require("mini.pairs").setup({
      mappings = {
        ["("] = { neigh_pattern = "[^\\][%s%)%]%}]" },
        ["["] = { neigh_pattern = "[^\\][%s%)%]%}]" },
        ["{"] = { neigh_pattern = "[^\\][%s%)%]%}]" },
        ['"'] = { neigh_pattern = "[^A-Za-eg-z0-9%p][^%w%p]" },
        ["'"] = { neigh_pattern = "[^%w%p][^%w%p]" },
        ["`"] = { neigh_pattern = "[^%w%p][^%w%p]" },
      },
    })
  end
)
