local available, _ = pcall(require, 'mini.starter')
if not available then return end

require('mini.bufremove').setup()
vim.api.nvim_command(':command! BD lua MiniBufremove.delete(0, true)')
vim.api.nvim_command(':command! BW lua MiniBufremove.wipeout(0, true)')

require('mini.comment').setup()

require('mini.cursorword').setup({
  delay = 100
})

local neigh_pattern = '.[%s%)%]%}]'
local quote_neigh_pattern = '[%{%[%(%=%s][%s%)%]%}]'
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

local starter = require('mini.starter')
local function actions_section()
  return {
    { action = 'enew', name = 'New buffer', section = 'Actions' },
    { action = 'qall', name = 'Quit', section = 'Actions' },
  }
end
local function header()
  local version = vim.version()
  return string.format(
    'NVIM v%d.%d.%d %s',
    version.major, version.minor, version.patch,
    jit.version
  )
end
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniStarterOpened',
  callback = function(args)
    local width = vim.api.nvim_win_get_width(0)

    vim.api.nvim_create_autocmd('CursorMoved', {
      buffer = args.buf,
      callback = function()
        local current_width = vim.api.nvim_win_get_width(0)
        if width ~= current_width then
          width = current_width
          MiniStarter.refresh()
        end
      end
    })
  end
})
starter.setup({
  evaluate_single = true,
  header = header,
  items = {
    starter.sections.recent_files(9, false),
    actions_section,
  },
  footer = '',
  content_hooks = {
    starter.gen_hook.indexing('all', { 'Actions' }),
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.aligning('center', 'center'),
  },
})

require('mini.surround').setup()

require('mini.trailspace').setup()
