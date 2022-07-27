require('mini.bufremove').setup()
vim.api.nvim_command(":command! BD lua MiniBufremove.delete()")
vim.api.nvim_command(":command! BW lua MiniBufremove.wipeout()")
vim.api.nvim_command(":command! BU lua MiniBufremove.unshow()")

require('mini.comment').setup()

require('mini.completion').setup({
  set_vim_settings = false,
})

require('mini.cursorword').setup()

require('mini.indentscope').setup()

require('mini.jump').setup()

require('mini.pairs').setup()

require('mini.sessions').setup({
  directory = ''
})

local starter = require('mini.starter')
starter.setup({
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(10, false),
    starter.sections.sessions(5, true)
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Builtin actions' }),
    starter.gen_hook.padding(3, 2),
  },
})

require('mini.surround').setup()

require('mini.tabline').setup({
  show_icons = false,
})

require('mini.trailspace').setup()
