local available, _ = pcall(require, "mini.starter")
if not available then return end

require('mini.bufremove').setup()
vim.api.nvim_command(":command! BD lua MiniBufremove.delete()")
vim.api.nvim_command(":command! BW lua MiniBufremove.wipeout()")
vim.api.nvim_command(":command! BU lua MiniBufremove.unshow()")

require('mini.comment').setup()

require('mini.cursorword').setup({
  delay = 100
})

require('mini.pairs').setup({
  mappings = {
    ['('] = { neigh_pattern = '.[^%w\\]' },
    [')'] = { neigh_pattern = '.[^%w\\]' },
    ['['] = { neigh_pattern = '.[^%w\\]' },
    [']'] = { neigh_pattern = '.[^%w\\]' },
    ['{'] = { neigh_pattern = '.[^%w\\]' },
    ['}'] = { neigh_pattern = '.[^%w\\]' },
    ['"'] = { neigh_pattern = '.[^%w\\]' },
    ["'"] = { neigh_pattern = '.[^%w\\]' },
    ['`'] = { neigh_pattern = '.[^%w\\]', },
  }
})

require('mini.sessions').setup({
  directory = ''
})

local starter = require('mini.starter')
starter.setup({
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(15, false),
    starter.sections.sessions(5, true)
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Builtin actions' }),
    starter.gen_hook.padding(3, 2),
  },
})

require('mini.surround').setup()

require('mini.trailspace').setup()
