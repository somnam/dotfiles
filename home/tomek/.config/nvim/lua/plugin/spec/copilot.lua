return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  enabled = false,
  config = function()
    local copilot_suggestion = require("copilot.suggestion")

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

    for _, mode in ipairs({"i", "s"}) do
      vim.api.nvim_set_keymap(
        mode, "<Tab>", "",
        {noremap = true, silent = true, callback = H.accept_suggestion}
      )
    end

    -- setup
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {accept = false},
        debounce = 150,
      },
      panel = {
        enabled = false,
      }
    })
  end
}
