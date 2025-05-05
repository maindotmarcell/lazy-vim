-- -- Nord
-- return {
--   "gbprod/nord.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nord").setup({})
--     vim.cmd.colorscheme("nord")
--   end,
-- }

-- Tokyonight
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

-- -- Solarized
-- --
-- local isTransparent = false
-- local function toggleTransparent()
--   isTransparent = not isTransparent
--   require("solarized").setup({ transparent = { enabled = isTransparent } })
--   vim.cmd.colorscheme("solarized")
-- end
--
-- return {
--   "maxmx01/solarized.nvim",
--   lazy = false,
--   priority = 998,
--   ---@type solarized.config
--   opts = { transparent = { enabled = isTransparent } },
--   config = function(_, opts)
--     vim.o.termguicolors = true
--     vim.o.background = "dark"
--     require("solarized").setup(opts)
--     vim.cmd.colorscheme("solarized")
--     vim.keymap.set("n", "<leader>t", toggleTransparent, { desc = "Toggle transparent background" })
--   end,
-- }
