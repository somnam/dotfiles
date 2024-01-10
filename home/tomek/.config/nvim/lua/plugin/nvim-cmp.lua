return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local buffer = require("util.buffer")

      local H = {}

      H.max_size = 1024 * 1024

      H.current_buffer_enabled = function()
        return not buffer.excluded(vim.api.nvim_get_current_buf())
      end

      H.get_bufnrs = function()
        local valid_buffers = {}

        for _, bufnr in pairs(vim.api.nvim_list_bufs()) do
          local invalid_buffer = (
            buffer.above_max_size(bufnr, H.max_size)
            or not buffer.listed(bufnr)
            or buffer.excluded(bufnr)
          )
          if not invalid_buffer then
            table.insert(valid_buffers, bufnr)
          end
        end

        return valid_buffers
      end

      H.buffer_option = {
        get_bufnrs = H.get_bufnrs,
        indexing_interval = 500,
      }

      H.window_option = cmp.config.window.bordered()

      return require("util.misc").map_extend({
        sources = {
          { name = "nvim_lsp", group_index = 1 },
          { name = "buffer", group_index = 2, keyword_length = 2, option = H.buffer_option },
          { name = "path", group_index = 3, keyword_length = 2 },
        },
        enabled = H.current_buffer_enabled,
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        performance = {
          debounce = 150,
        },
        window = {
          completion = H.window_option,
          documentation = H.window_option,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.locality,
            cmp.config.compare.recently_used,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.order,
          }
        }
      }, opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {"hrsh7th/cmp-nvim-lsp"},
    opts = function(_, opts)
      return require("util.misc").map_extend(opts, {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end
  }
}
