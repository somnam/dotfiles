local add = require("mini.deps").add
local now = require("mini.deps").now

now(function()
  add({ source = "nvim-tree/nvim-tree.lua" })

  local function on_attach(bufnr)
    require("nvim-tree.api").config.mappings.default_on_attach(bufnr)

    local opts = { noremap = true, silent = true, nowait = true }
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<C-k>")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<C-x>")
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<C-s>",
      ":lua require('nvim-tree.api').node.open.horizontal()<Enter>",
      vim.tbl_extend("keep", { desc = "Open: Horizontal Split" }, opts)
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<C-f>",
      ":lua require('nvim-tree.api').node.show_info_popup()<Enter>",
      vim.tbl_extend("keep", { desc = "Info" }, opts)
    )
  end

  require("nvim-tree").setup({
    disable_netrw = true,
    sync_root_with_cwd = true,
    view = { width = 30 },
    on_attach = on_attach,
    renderer = {
      highlight_git = true,
      highlight_opened_files = "name",
      highlight_modified = "name",
      icons = {
        git_placement = "after",
        modified_placement = "before",
        show = { file = false, folder = false },
        glyphs = {
          folder = { arrow_closed = "▶", arrow_open = "▼" },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "!",
            renamed = "➜",
            untracked = "?",
            deleted = "-",
            ignored = "◌",
          },
        },
      },
    },
    filesystem_watchers = {
      debounce_delay = 250,
    },
  })

  vim.keymap.set(
    "n",
    "<leader>e",
    ":NvimTreeToggle<Enter>",
    { noremap = true, silent = true, desc = "Open or close the file explorer" }
  )

  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("nvim_tree_trigger", { clear = true }),
    callback = function(ctx)
      if vim.fn.isdirectory(ctx.file) == 1 then
        require("nvim-tree.api").tree.open()
      end
    end,
  })
end)
