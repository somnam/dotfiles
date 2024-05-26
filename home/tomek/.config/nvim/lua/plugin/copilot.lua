local H = {}

H.tab = vim.api.nvim_replace_termcodes("<tab>", true, false, true)

H.set_accept_suggestion_keymap = function()
  vim.keymap.set({ "i", "s", "n" }, "<Tab>", H.accept_suggestion, { noremap = true, silent = true })
end

H.del_accept_suggestion_keymap = function()
  vim.keymap.del({ "i", "s", "n" }, "<Tab>")
end

H.accept_suggestion = function()
  local copilot_suggestion = require("copilot.suggestion")
  local cmp_ok, cmp = pcall(require, "cmp")

  if copilot_suggestion.is_visible() then
    copilot_suggestion.accept()
    if cmp_ok and cmp.visible() then
      cmp.close()
    end
  else
    vim.api.nvim_feedkeys(H.tab, "n", true)
  end
end

H.enable_copilot = function()
  local copilot_client = require("copilot.client")
  local copilot_command = require("copilot.command")

  if copilot_client.is_disabled() then
    copilot_command.enable()
  end
  H.set_accept_suggestion_keymap()
  copilot_command.attach({ force = true })
end

H.disable_copilot = function()
  local copilot_client = require("copilot.client")
  local copilot_command = require("copilot.command")

  if not copilot_client.is_disabled() then
    H.del_accept_suggestion_keymap()
    copilot_command.detach()
    copilot_command.disable()
  end
end

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    cond = function()
      return require("util.command").executable("node")
    end,
    dependencies = { "AndreM222/copilot-lualine" },
    keys = {
      { "<Space>ce", H.enable_copilot, desc = "Enable Copilot for current buffer." },
      { "<Space>cd", H.disable_copilot, desc = "Disable Copilot for all buffers." },
    },
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = { accept = false },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        ["*"] = false,
      },
    },
  },
  {
    "AndreM222/copilot-lualine",
    lazy = true,
    dependencies = { "nvim-lualine/lualine.nvim" },
    config = function()
      local lualine_config = require("lualine_require").lazy_require({
        config_module = "lualine.config",
      })
      local current_config = lualine_config.config_module.get_config()

      table.insert(current_config.sections.lualine_y, 1, "copilot")

      require("lualine").setup(current_config)
    end,
  },
}
