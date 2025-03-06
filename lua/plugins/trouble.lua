return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup()

    -- Open diagnostic under cursor in floating window
    vim.keymap.set("n", "ge", function()
      vim.diagnostic.open_float({ scope = "cursor" })
    end, { desc = "Show diagnostic under cursor" })
  end,
}
