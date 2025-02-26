return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    -- Default model to use when starting CopilotChat
    model = "claude-3.7-sonnet",
    -- Other configuration options
    show_help = "yes", -- Show help text for CopilotChatInPlace
    debug = false, -- Enable debug logging
  },
  config = function(_, opts)
    local copilot_chat = require("CopilotChat")
    copilot_chat.setup(opts)
  end,
}
