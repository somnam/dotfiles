return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  enabled = false,
  config = function()
    -- setup
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        debounce = 150,
      },
      panel = {
        enabled = false,
      }
    })
  end
}
