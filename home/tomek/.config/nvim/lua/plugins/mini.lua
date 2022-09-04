local available, _ = pcall(require, "mini.starter")
if not available then return end

require('mini.bufremove').setup()
vim.api.nvim_command(":command! BD lua MiniBufremove.delete(0, true)")
vim.api.nvim_command(":command! BW lua MiniBufremove.wipeout(0, true)")

require('mini.comment').setup()

require('mini.cursorword').setup({
  delay = 100
})

local neigh_pattern = '.[%s%)%]%}]'
local quote_neigh_pattern = '[%{%[%(%s][%s%)%]%}]'
require('mini.pairs').setup({
  mappings = {
    ['('] = { neigh_pattern = neigh_pattern },
    ['['] = { neigh_pattern = neigh_pattern },
    ['{'] = { neigh_pattern = neigh_pattern },
    ['"'] = { action = 'open', neigh_pattern = quote_neigh_pattern },
    ["'"] = { action = 'open', neigh_pattern = quote_neigh_pattern },
    ['`'] = { action = 'open', neigh_pattern = quote_neigh_pattern },
  }
})

require('mini.sessions').setup({
  directory = ''
})

local starter = require('mini.starter')
local actions_section = function()
  return function()
    return {
      { action = 'Telescope oldfiles',        name = 'Previous files',  section = 'Actions' },
      { action = 'Telescope find_files',      name = 'Find files',      section = 'Actions' },
      { action = 'Telescope git_files',       name = 'Git files',       section = 'Actions' },
      { action = 'Telescope live_grep',       name = 'Live grep',       section = 'Actions' },
      { action = 'Telescope command_history', name = 'Command history', section = 'Actions' },
      { action = 'enew',                      name = 'New buffer',      section = 'Actions' },
      { action = 'qall',                      name = 'Quit Neovim',     section = 'Actions' },
    }
  end
end
starter.setup({
  evaluate_single = true,
  items = {
    actions_section(),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Actions' }),
    starter.gen_hook.padding(3, 2),
  },
})

require('mini.surround').setup()

require('mini.trailspace').setup()
