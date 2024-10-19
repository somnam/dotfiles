local H = {
  config_paths = { "$XDG_CONFIG_HOME", "$HOME/.config", "$HOME/AppData/Local" },
}

H.hosts_file_exists = function()
  for _, path in ipairs(H.config_paths) do
    local config_path = vim.fn.expand(path)
    if vim.fn.isdirectory(config_path) > 0 then
      local file_path = string.format("%s/github-copilot/hosts.json", config_path)
      if vim.fn.filereadable(file_path) == 1 then
        return true
      end
    end
  end
  return false
end

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  build = "make tiktoken",
  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatStop",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatDebugInfo",
    "CopilotChatModels",
    "CopilotChatModel",
    "CopilotChatExplain",
    "CopilotChatReview",
    "CopilotChatFix",
    "CopilotChatOptimize",
    "CopilotChatDocs",
    "CopilotChatTests",
    "CopilotChatFixDiagnostic",
    "CopilotChatCommit",
    "CopilotChatCommitStaged",
  },
  cond = function()
    return require("util.command").executable("curl") and H.hosts_file_exists()
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    mappings = {
      close = {
        insert = "",
      },
      reset = {
        normal = "<C-e>",
        insert = "<C-e>",
      },
      submit_prompt = {
        normal = "<C-s>",
        insert = "<C-s>",
      },
    },
  },
}
