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

return {
  "nvim-tree/nvim-tree.lua",
  event = "VimEnter",
  keys = {
    {
      "<Space>e",
      ":NvimTreeToggle<Enter>",
      noremap = true,
      silent = true,
      desc = "Open or close the file tree"
    },
  },
  opts = {
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
  },
  config = function(_, opts)
    local nvim_tree_api = require("nvim-tree.api")

    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("nvim_tree_trigger", { clear = true }),
      callback = function(ctx)
        if vim.fn.isdirectory(ctx.file) == 1 then
          nvim_tree_api.tree.open()
        end
      end
    })

    return require("nvim-tree").setup(opts)
  end
}
