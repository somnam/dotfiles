return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = {"BufReadPost", "BufNewFile"},
  enabled = true,
  config = function()
    local copilot_suggestion = require("copilot.suggestion")
    local copilot_client = require("copilot.client")
    local copilot_command = require("copilot.command")

    local H = {}

    H.esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
    H.tab = vim.api.nvim_replace_termcodes("<tab>", true, false, true)

    H.accept_suggestion = function()
      if copilot_suggestion.is_visible() then
        copilot_suggestion.accept()
        vim.api.nvim_feedkeys(H.esc, "n", true)
      else
        vim.api.nvim_feedkeys(H.tab, "n", true)
      end
    end

    H.enable_copilot = function()
      if copilot_client.is_disabled() then
        copilot_command.enable()
      end
      copilot_command.attach({force = true})
    end

    H.toggle_copilot = function()
      if not copilot_client.is_disabled() then
        copilot_command.toggle({force = true})
      end
    end

    H.disable_copilot = function()
      if not copilot_client.is_disabled() then
        copilot_command.detach()
        copilot_command.disable()
      end
    end

    -- keymap
    local opts = {noremap = true, silent = true}
    for _, mode in ipairs({"i", "s"}) do
      vim.api.nvim_set_keymap(
        mode, "<Tab>", "",
        vim.tbl_extend("keep", {callback = H.accept_suggestion}, opts)
      )
    end

    vim.api.nvim_set_keymap("n", "<Space>ce", "", vim.tbl_extend("keep", opts, {
      callback = H.enable_copilot,
      desc = "Enable Copilot for current buffer.",
    }))

    vim.api.nvim_set_keymap("n", "<Space>ct", "", vim.tbl_extend("keep", opts, {
      callback = H.toggle_copilot,
      desc = "Toggle Copilot for current buffer.",
    }))

    vim.api.nvim_set_keymap("n", "<Space>cd", "", vim.tbl_extend("keep", opts, {
      callback = H.disable_copilot,
      desc = "Disable Copilot for all buffers.",
    }))

    -- setup
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {accept = false},
        debounce = 150,
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        ["*"] = false,
      }
    })
  end
}
