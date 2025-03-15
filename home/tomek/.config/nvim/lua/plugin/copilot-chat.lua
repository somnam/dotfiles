local config = require("core.config")

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  build = "make tiktoken",
  cmd = {
    "CopilotChat",
    "CopilotChatCommit",
    "CopilotChatDocs",
    "CopilotChatExplain",
    "CopilotChatFix",
    "CopilotChatFixDiagnostic",
    "CopilotChatLoad",
    "CopilotChatModels",
    "CopilotChatOptimize",
    "CopilotChatReview",
    "CopilotChatTests",
    "CopilotChatToggle",
  },
  cond = function()
    return require("util.command").executable("curl")
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<Space>a",
      ":CopilotChatToggle<Enter>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
      desc = "Open or close the chat window",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "copilot-chat",
      group = vim.api.nvim_create_augroup("copilot_chat_open", { clear = true }),
      callback = function()
        vim.schedule(function()
          vim.cmd("wincmd =")
        end)
      end,
    })
  end,
  opts = {
    model = config.get("plugin.copilot_chat.model"),
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
