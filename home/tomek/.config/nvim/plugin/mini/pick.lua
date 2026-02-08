local now = require("mini.deps").now

now(function()
  local mini_pick = require("mini.pick")
  local vim_paste = vim.paste

  ---@param keys string
  local function feedkeys(keys)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), "n", true)
  end

  ---@param items table
  ---@param opts table|nil
  local function choose_marked(items, opts)
    mini_pick.default_choose_marked(items, opts)
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
    local current_caret = mini_pick.get_picker_state().caret
    local query_end = #mini_pick.get_picker_query() + 1
    caret = math.max(1, math.min(caret, query_end))
    local move = caret - current_caret
    local keys = string.rep(move >= 0 and "<Right>" or "<Left>", math.abs(move))
    feedkeys(keys)
  end

  local function move_caret_prev_word()
    local query = table.concat(mini_pick.get_picker_query())
    local caret = mini_pick.get_picker_state().caret
    local word_start = string.find(string.sub(query, 1, caret - 1), "%S+%s*$")
    move_caret(word_start or 1)
  end

  local function move_caret_next_word()
    local query = table.concat(mini_pick.get_picker_query())
    local caret = mini_pick.get_picker_state().caret
    local word_end = string.find(query, "%f[%s]", caret + 1)
    move_caret(word_end or #query + 1)
  end

  mini_pick.setup({
    source = {
      choose_marked = choose_marked,
    },
    mappings = {
      choose_marked_alt = { char = "<M-q>", func = function() feedkeys("<M-CR>") end },
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
      move_start = "<C-k>",
      refine = "<C-g>",
      refine_marked = "<M-g>",
      scroll_down = "<S-Down>",
      scroll_down_nav = { char = "<PageDown>", func = function() feedkeys("<S-Down>") end },
      scroll_left = "<S-Left>",
      scroll_right = "<S-Right>",
      scroll_up = "<S-Up>",
      scroll_up_nav = { char = "<PageUp>", func = function() feedkeys("<S-Up>") end },
      toggle_info = "<F1>",
    },
    window = {
      config = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        local row = math.floor(0.2 * (vim.o.lines - height))
        local col = math.floor(0.5 * (vim.o.columns - width))
        return { anchor = "NW", height = height, width = width, row = row, col = col }
      end,
      prompt_caret = "┃",
      prompt_prefix = "❯ ",
    },
  })

  -- Override paste to work inside picker
  vim.paste = function(...)
    if mini_pick.is_picker_active() then
      local clip = vim.o.clipboard
      local reg = clip:find("unnamedplus") and "+" or (clip:find("unnamed") and "*" or '"')
      feedkeys("<C-r>" .. reg)
      return
    end
    return vim_paste(...)
  end

  local buffer_ns = vim.api.nvim_create_namespace("MiniPickBuffer")
  mini_pick.registry.buffers = function(local_opts)
    local buffer_mappings = {
      wipeout = {
        char = "<C-x>",
        func = function()
          local bufnr = mini_pick.get_picker_matches().current.bufnr
          if vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end,
      },
    }

    ---@param buf_id number
    ---@param items table
    ---@param query table
    local function buffer_show(buf_id, items, query)
      mini_pick.default_show(buf_id, items, query, { show_icons = true })

      vim.api.nvim_buf_clear_namespace(buf_id, buffer_ns, 0, -1)

      local modified_mark = { virt_text = { { "[+]", "DiagnosticHint" } }, virt_text_pos = "eol" }
      local readonly_mark = { virt_text = { { "[RO]", "DiagnosticHint" } }, virt_text_pos = "eol" }

      for i, item in ipairs(items) do
        if vim.api.nvim_buf_is_valid(item.bufnr) then
          if vim.bo[item.bufnr].modified then
            vim.api.nvim_buf_set_extmark(buf_id, buffer_ns, i - 1, 0, modified_mark)
          end
          if vim.bo[item.bufnr].readonly then
            vim.api.nvim_buf_set_extmark(buf_id, buffer_ns, i - 1, 0, readonly_mark)
          end
        end
      end
    end

    return mini_pick.builtin.buffers(
      local_opts,
      { mappings = buffer_mappings, source = { show = buffer_show } }
    )
  end

  ---@param local_opts table|nil
  mini_pick.registry.files = function(local_opts)
    local cwd = (local_opts and local_opts.cwd) or vim.fn.getcwd()
    local short_cwd = vim.fn.pathshorten(vim.fn.fnamemodify(cwd, ":~")):gsub("/?$", "/")
    local prompt_prefix = mini_pick.config.window.prompt_prefix .. short_cwd

    return mini_pick.builtin.files(local_opts, { window = { prompt_prefix = prompt_prefix } })
  end

  ---@param local_opts table|nil
  mini_pick.registry.git_status = function(local_opts)
    local cwd = (local_opts and local_opts.cwd) or vim.fn.getcwd()
    local command = {
      "git",
      "-C",
      cwd,
      "-c",
      "color.status=never",
      "status",
      "--short",
      "--untracked-files=all",
    }

    ---@param item string
    ---@return string
    local function parse_item(item)
      -- Handle renamed files
      return item:match("^R.* %-> (.+)$") or item:sub(4)
    end

    ---@param items table
    ---@return table
    local function parse_items(items)
      local parsed_items = {}
      for _, item in ipairs(items) do
        table.insert(parsed_items, parse_item(item))
      end
      return parsed_items
    end

    return mini_pick.builtin.cli({ command = command }, {
      source = {
        name = "Git Status",
        preview = function(buf_id, item) mini_pick.default_preview(buf_id, parse_item(item)) end,
        choose = function(item) mini_pick.default_choose(parse_item(item)) end,
        choose_marked = function(items, opts) choose_marked(parse_items(items), opts) end,
      },
    })
  end

  local mini_extra = require("mini.extra")
  mini_extra.setup()

  local opts = { noremap = true, silent = true }

  vim.keymap.set(
    "n",
    "<leader><leader>",
    function() mini_pick.registry.resume() end,
    vim.tbl_extend("keep", { desc = "Continue last search" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>p",
    function() mini_extra.pickers.oldfiles({ current_dir = true }) end,
    vim.tbl_extend("keep", { desc = "List opened local files history" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>P",
    function() mini_extra.pickers.oldfiles() end,
    vim.tbl_extend("keep", { desc = "List opened global files history" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>f",
    function() mini_pick.registry.files() end,
    vim.tbl_extend("keep", { desc = "Find files on a path" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>b",
    function() mini_pick.registry.buffers() end,
    vim.tbl_extend("keep", { desc = "List opened buffers" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>:",
    function() mini_extra.pickers.history({ scope = ":" }) end,
    vim.tbl_extend("keep", { desc = "List command history" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>h",
    function() mini_pick.registry.help() end,
    vim.tbl_extend("keep", { desc = "List help tags" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>gs",
    function() mini_pick.registry.git_status() end,
    vim.tbl_extend("keep", { desc = "Show working tree status" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>gl",
    function() mini_extra.pickers.git_commits({ path = vim.fn.expand("%") }) end,
    vim.tbl_extend("keep", { desc = "Show current buffer commit logs" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>w",
    function() mini_pick.registry.grep_live() end,
    vim.tbl_extend("keep", { desc = "Live grep the current project" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>o",
    function() mini_extra.pickers.lsp({ scope = "workspace_symbol_live" }) end,
    vim.tbl_extend("keep", { desc = "Live grep workspace symbols" }, opts)
  )
  vim.keymap.set(
    "n",
    "<leader>d",
    function() mini_extra.pickers.diagnostic({ scope = "current" }) end,
    vim.tbl_extend("keep", { desc = "List all buffer diagnostics" }, opts)
  )
  vim.keymap.set(
    "n",
    "grr",
    function() mini_extra.pickers.lsp({ scope = "references" }) end,
    vim.tbl_extend("keep", { desc = "List all symbol references" }, opts)
  )
  vim.keymap.set(
    "n",
    "gri",
    function() mini_extra.pickers.lsp({ scope = "implementation" }) end,
    vim.tbl_extend("keep", { desc = "List all symbol implementations" }, opts)
  )
  vim.keymap.set(
    "n",
    "gra",
    function() vim.lsp.buf.code_action() end,
    vim.tbl_extend("keep", { desc = "Select code action at cursor position" }, opts)
  )
end)
