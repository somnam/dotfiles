-- utils

---@param keys string
local function input(keys)
  vim.api.nvim_input(vim.api.nvim_replace_termcodes(keys, true, true, true))
end

---@param items table
---@param opts table|nil
local function choose_marked(items, opts)
  MiniPick.default_choose_marked(items, opts)
  vim.schedule(function()
    opts = opts or {}
    if opts.list_type == "location" then
      if #vim.fn.getloclist(0) > 0 then
        vim.cmd("lopen | wincmd p | lfirst | normal! zvzz")
      end
    else
      if #vim.fn.getqflist() > 0 then
        vim.cmd("copen | wincmd p | cfirst | normal! zvzz")
      end
    end
  end)
end

---@param caret number
local function move_caret(caret)
  local current_caret = MiniPick.get_picker_state().caret
  local query_end = #MiniPick.get_picker_query() + 1
  caret = math.max(1, math.min(caret, query_end))
  local move = caret - current_caret
  local keys = string.rep(move >= 0 and "<Right>" or "<Left>", math.abs(move))
  input(keys)
end

local function move_caret_prev_word()
  local query = table.concat(MiniPick.get_picker_query())
  local caret = MiniPick.get_picker_state().caret
  local word_start = string.find(string.sub(query, 1, caret - 1), "%S+%s*$")
  move_caret(word_start or 1)
end

local function move_caret_next_word()
  local query = table.concat(MiniPick.get_picker_query())
  local caret = MiniPick.get_picker_state().caret
  local word_end = string.find(query, "%f[%s]", caret + 1)
  move_caret(word_end or #query + 1)
end

-- preview

local preview = (function()
  local config = { orientation = "vertical", ratio = 0.6 }
  local state = { win_id = nil, buf_id = nil, last_item = nil, is_hidden = false }
  local cache = { win_config = {} }
  local scroll_map = { up = "<C-b>", down = "<C-f>", left = "zH", right = "zL" }

  local function reset()
    state.win_id = nil
    state.buf_id = nil
    state.last_item = nil
    state.is_hidden = false
    cache.win_config = {}
  end

  local function has_win() return state.win_id ~= nil and vim.api.nvim_win_is_valid(state.win_id) end

  local function create_buf()
    state.buf_id = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(state.buf_id, "minipick://" .. state.buf_id .. "/preview")
    vim.bo[state.buf_id].bufhidden = "wipe"
    vim.bo[state.buf_id].matchpairs = ""
    vim.b[state.buf_id].minicursorword_disable = true
    vim.b[state.buf_id].miniindentscope_disable = true
  end

  ---@param win_config vim.api.keyset.win_config
  local function create_win(win_config)
    win_config.style = "minimal"
    state.win_id = vim.api.nvim_open_win(state.buf_id, false, win_config)
    vim.wo[state.win_id].foldenable = false
    vim.wo[state.win_id].foldmethod = "manual"
    vim.wo[state.win_id].linebreak = true
    vim.wo[state.win_id].scrolloff = 0
    vim.wo[state.win_id].winhighlight = "NormalFloat:MiniPickNormal,FloatBorder:MiniPickBorder"
    vim.wo[state.win_id].wrap = true
  end

  local function close_buf()
    pcall(vim.api.nvim_buf_delete, state.buf_id, { force = true })
    state.buf_id = nil
  end

  local function close_win()
    if has_win() then
      pcall(vim.api.nvim_win_close, state.win_id, true)
    end
    state.win_id = nil
  end

  local function close()
    close_win()
    close_buf()
    state.last_item = nil
  end

  ---@param item table | nil
  local function show_preview(item)
    if item ~= nil then
      local preview_func = MiniPick.get_picker_opts().source.preview
      pcall(preview_func, state.buf_id, item)
    else
      vim.api.nvim_buf_set_lines(state.buf_id, 0, -1, false, {})
    end
  end

  ---@param border string[] | string
  local function compute_border_size(border)
    local n = type(border) == "table" and #border or 0
    if n == 0 then
      return 2
    elseif config.orientation == "vertical" then
      return ((border[3 % n + 1] == "" and 0 or 1) + (border[7 % n + 1] == "" and 0 or 1))
    else
      return ((border[1 % n + 1] == "" and 0 or 1) + (border[5 % n + 1] == "" and 0 or 1))
    end
  end

  ---@param window_config vim.api.keyset.win_config
  ---@param preview_config vim.api.keyset.win_config
  local function compute_layout(window_config, preview_config)
    local preview_ratio = config.ratio
    local border_size = compute_border_size(window_config.border)

    if config.orientation == "vertical" then
      local preview_size = math.floor(preview_ratio * (window_config.width + border_size))
      local preview_width = math.max(1, preview_size - border_size)
      local main_width = math.max(1, window_config.width - preview_width - border_size)
      window_config.width = main_width
      preview_config.width = preview_width
      preview_config.col = window_config.col + (main_width + border_size)
    else
      local preview_size = math.floor(preview_ratio * (window_config.height + border_size))
      local preview_height = math.max(1, preview_size - border_size)
      local main_height = math.max(1, window_config.height - preview_height - border_size)
      window_config.height = main_height
      preview_config.height = preview_height
      if window_config.anchor == "SW" then
        window_config.row = window_config.row - (preview_height + border_size)
      else
        preview_config.row = window_config.row + (main_height + border_size)
      end
    end
  end

  ---@param opts table | nil
  local function setup(opts) config = vim.tbl_deep_extend("force", config, opts or {}) end

  ---@param direction "up" | "down" | "left" | "right"
  local function scroll(direction)
    if not has_win() then
      return
    end
    local keys = vim.api.nvim_replace_termcodes(scroll_map[direction], true, true, true)
    vim.api.nvim_win_call(state.win_id, function() vim.cmd("normal! " .. keys) end)
  end

  local function cache_win_config()
    local picker_state = MiniPick.get_picker_state()
    if not (picker_state.windows and picker_state.windows.main) then
      return
    end
    local window_config = vim.api.nvim_win_get_config(picker_state.windows.main)
    local keys = { "anchor", "border", "col", "height", "relative", "row", "width", "zindex" }
    for _, key in ipairs(keys) do
      cache.win_config[key] = window_config[key]
    end
  end

  local function update()
    if state.is_hidden then
      close()
      return
    end

    local picker_state = MiniPick.get_picker_state()
    if not (picker_state.windows and picker_state.windows.main) then
      return
    end

    local window_config = vim.deepcopy(cache.win_config)
    local preview_config = vim.deepcopy(cache.win_config)
    compute_layout(window_config, preview_config)

    vim.api.nvim_win_set_config(picker_state.windows.main, window_config)

    if not has_win() then
      create_buf()
      create_win(preview_config)
    else
      vim.api.nvim_win_set_config(state.win_id, preview_config)
    end

    local current_item = MiniPick.get_picker_matches().current
    if current_item ~= state.last_item then
      state.last_item = current_item
      create_buf()
      vim.api.nvim_win_set_buf(state.win_id, state.buf_id)
      show_preview(current_item)
    end
  end

  local function toggle()
    MiniPick.refresh()
    state.is_hidden = not state.is_hidden
    update()
  end

  local function stop()
    close()
    reset()
  end

  -- Update preview on picker refresh
  local mini_pick = require("mini.pick")
  local mini_pick_refresh = mini_pick.refresh
  mini_pick.refresh = function()
    mini_pick_refresh()
    if mini_pick.is_picker_active() then
      cache_win_config()
      vim.schedule(update)
    end
  end

  return {
    setup = setup,
    scroll = scroll,
    cache_win_config = cache_win_config,
    update = update,
    toggle = toggle,
    stop = stop,
  }
end)()

-- autocmds

local group = vim.api.nvim_create_augroup("UserMiniPick", { clear = true })

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniPickStart",
  group = group,
  callback = function()
    preview.cache_win_config()
    preview.update()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniPickMatch",
  group = group,
  callback = function() vim.schedule(preview.update) end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniPickStop",
  group = group,
  callback = preview.stop,
})

-- setup

MiniDeps.now(function()
  local vim_paste = vim.paste

  require("mini.pick").setup({
    source = {
      choose_marked = choose_marked,
    },
    mappings = {
      choose_marked_alt = { char = "<M-q>", func = function() input("<M-CR>") end },
      delete_word = "<M-BS>",
      mark = "<M-x>",
      mark_all = "<M-a>",
      move_caret_end = { char = "<C-e>", func = function() move_caret(math.huge) end },
      move_caret_end_nav = { char = "<End>", func = function() move_caret(math.huge) end },
      move_caret_next_word = { char = "<C-Right>", func = move_caret_next_word },
      move_caret_next_word_alt = { char = "<M-Right>", func = move_caret_next_word },
      move_caret_prev_word = { char = "<C-Left>", func = move_caret_prev_word },
      move_caret_prev_word_alt = { char = "<M-Left>", func = move_caret_prev_word },
      move_caret_start = { char = "<C-a>", func = function() move_caret(1) end },
      move_caret_start_nav = { char = "<Home>", func = function() move_caret(1) end },
      move_down_arrow = {
        char = "<Down>",
        func = function()
          input("<C-n>")
          vim.schedule(preview.update)
        end,
      },
      move_start = "",
      move_up_arrow = {
        char = "<Up>",
        func = function()
          input("<C-p>")
          vim.schedule(preview.update)
        end,
      },
      refine = "<C-g>",
      refine_marked = "<M-g>",
      scroll_down_nav = {
        char = "<PageDown>",
        func = function()
          input("<C-f>")
          vim.schedule(preview.update)
        end,
      },
      scroll_side_preview_down = {
        char = "<S-Down>",
        func = function() preview.scroll("down") end,
      },
      scroll_side_preview_up = { char = "<S-Up>", func = function() preview.scroll("up") end },
      scroll_up_nav = {
        char = "<PageUp>",
        func = function()
          input("<C-b>")
          vim.schedule(preview.update)
        end,
      },
      toggle_preview = "",
      toggle_side_preview = { char = "<Tab>", func = preview.toggle },
    },
    window = {
      config = function()
        local height = math.floor(0.803 * vim.o.lines)
        local width = math.floor(0.613 * vim.o.columns)
        local row = math.floor(0.4 * (vim.o.lines - height))
        local col = math.floor(0.5 * (vim.o.columns - width))
        return { anchor = "NW", height = height, width = width, row = row, col = col }
      end,
      prompt_caret = "│",
      prompt_prefix = "❯ ",
    },
  })

  preview.setup({ orientation = "horizontal" })

  -- Override paste
  vim.paste = function(...)
    if MiniPick.is_picker_active() then
      local clip = vim.o.clipboard
      local reg = clip:find("unnamedplus") and "+" or (clip:find("unnamed") and "*" or '"')
      input("<C-r>" .. reg)
      return
    end
    return vim_paste(...)
  end

  require("mini.extra").setup()

  local namespace = vim.api.nvim_create_namespace("MiniPickBuffer")
  MiniPick.registry.buffers = function(local_opts)
    local buffer_mappings = {
      wipeout = {
        char = "<C-x>",
        func = function()
          local bufnr = MiniPick.get_picker_matches().current.bufnr
          if vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end,
      },
    }

    local modified_mark = { virt_text = { { "[+]", "DiagnosticHint" } }, virt_text_pos = "eol" }
    local readonly_mark = { virt_text = { { "[RO]", "DiagnosticHint" } }, virt_text_pos = "eol" }

    local function buffer_show(buf_id, items, query)
      MiniPick.default_show(buf_id, items, query, { show_icons = true })
      vim.api.nvim_buf_clear_namespace(buf_id, namespace, 0, -1)
      for i, item in ipairs(items) do
        if vim.api.nvim_buf_is_valid(item.bufnr) then
          if vim.bo[item.bufnr].modified then
            vim.api.nvim_buf_set_extmark(buf_id, namespace, i - 1, 0, modified_mark)
          end
          if vim.bo[item.bufnr].readonly then
            vim.api.nvim_buf_set_extmark(buf_id, namespace, i - 1, 0, readonly_mark)
          end
        end
      end
    end

    return MiniPick.builtin.buffers(
      local_opts,
      { mappings = buffer_mappings, source = { show = buffer_show } }
    )
  end

  MiniPick.registry.files = function(local_opts)
    local cwd = (local_opts and local_opts.cwd) or vim.fn.getcwd()
    local short_cwd = vim.fn.pathshorten(vim.fn.fnamemodify(cwd, ":~")):gsub("/?$", "/")
    local prompt_prefix = MiniPick.config.window.prompt_prefix .. short_cwd
    return MiniPick.builtin.files(local_opts, { window = { prompt_prefix = prompt_prefix } })
  end

  MiniPick.registry.git_status = function(local_opts)
    local cwd = (local_opts and local_opts.cwd) or vim.fn.getcwd()
    local command =
      { "git", "-C", cwd, "-c", "color.status=never", "status", "--short", "--untracked-files=all" }
    local function parse_item(item) return item:match("^R.* %-> (.+)$") or item:sub(4) end
    local function parse_items(items)
      local parsed = {}
      for _, item in ipairs(items) do
        table.insert(parsed, parse_item(item))
      end
      return parsed
    end
    return MiniPick.builtin.cli({ command = command }, {
      source = {
        name = "Git Status",
        preview = function(buf_id, item) MiniPick.default_preview(buf_id, parse_item(item)) end,
        choose = function(item) MiniPick.default_choose(parse_item(item)) end,
        choose_marked = function(items, opts) choose_marked(parse_items(items), opts) end,
      },
    })
  end

  local opts = { noremap = true, silent = true }

  vim.keymap.set(
    "n",
    "<leader><leader>",
    function() MiniPick.registry.resume() end,
    vim.tbl_extend("keep", { desc = "Continue last search" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>p",
    function() MiniExtra.pickers.oldfiles({ current_dir = true }) end,
    vim.tbl_extend("keep", { desc = "List opened local files history" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>P",
    function() MiniExtra.pickers.oldfiles() end,
    vim.tbl_extend("keep", { desc = "List opened global files history" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>f",
    function() MiniPick.registry.files() end,
    vim.tbl_extend("keep", { desc = "Find files on a path" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>b",
    function() MiniPick.registry.buffers() end,
    vim.tbl_extend("keep", { desc = "List opened buffers" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>:",
    function() MiniExtra.pickers.history({ scope = ":" }) end,
    vim.tbl_extend("keep", { desc = "List command history" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>h",
    function() MiniPick.registry.help() end,
    vim.tbl_extend("keep", { desc = "List help tags" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>gs",
    function() MiniPick.registry.git_status() end,
    vim.tbl_extend("keep", { desc = "Show working tree status" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>gl",
    function() MiniExtra.pickers.git_commits({ path = vim.fn.expand("%") }) end,
    vim.tbl_extend("keep", { desc = "Show current buffer commit logs" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>w",
    function() MiniPick.registry.grep_live() end,
    vim.tbl_extend("keep", { desc = "Live grep the current project" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>o",
    function() MiniExtra.pickers.lsp({ scope = "workspace_symbol_live" }) end,
    vim.tbl_extend("keep", { desc = "Live grep workspace symbols" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>d",
    function() MiniExtra.pickers.diagnostic({ scope = "current" }) end,
    vim.tbl_extend("keep", { desc = "List all buffer diagnostics" }, opts)
  )
  vim.keymap.set(
    "n",
    "grr",
    function() MiniExtra.pickers.lsp({ scope = "references" }) end,
    vim.tbl_extend("keep", { desc = "List all symbol references" }, opts)
  )
  vim.keymap.set(
    "n",
    "gri",
    function() MiniExtra.pickers.lsp({ scope = "implementation" }) end,
    vim.tbl_extend("keep", { desc = "List all symbol implementations" }, opts)
  )
  vim.keymap.set(
    "n",
    "gra",
    function() vim.lsp.buf.code_action() end,
    vim.tbl_extend("keep", { desc = "Select code action at cursor position" }, opts)
  )
end)
