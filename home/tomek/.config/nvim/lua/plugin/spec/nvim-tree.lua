local P = {"nvim-tree/nvim-tree.lua"}

P.event = "VimEnter"

P.config = function()
  local nvim_tree = require("nvim-tree")

  local H = {}

  H.on_attach = function(bufnr)
    require('nvim-tree.api').config.mappings.default_on_attach(bufnr)

    local api = ":lua require('nvim-tree.api')."
    local opts = {noremap = true, silent = true, nowait = true}
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<C-k>")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<C-x>")
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F1>", api .. "tree.toggle_help()<Enter>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", api .. "node.open.horizontal()<Enter>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-f>", api .. "node.show_info_popup()<Enter>", opts)
  end

  -- keymap
  local opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap(
    "n", "<Space>e", ":NvimTreeToggle<Enter>",
    vim.tbl_extend("keep", {desc = "Open or close the file tree"}, opts)
  )

  -- autocmd
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("nvim_tree_trigger", { clear = true }),
    callback = function(ctx)
      if vim.fn.isdirectory(ctx.file) == 1 then
        require("nvim-tree.api").tree.open()
      end
    end
  })

  -- setup
  nvim_tree.setup({
    disable_netrw = true,
    sync_root_with_cwd = true,
    view = {
      width = 35,
     },
    on_attach = H.on_attach,
    renderer = {
      highlight_git = true,
      highlight_opened_files = "name",
      highlight_modified = "name",
      icons = {
        git_placement = "after",
        modified_placement = "before",
      },
    },
    filesystem_watchers = {
      debounce_delay = 200,
    },
  })
end

return P
