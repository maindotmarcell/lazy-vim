local isTransparent = false
local function toggleTransparent()
  isTransparent = not isTransparent
  require("solarized").setup({ transparent = { enabled = isTransparent } })
  vim.cmd.colorscheme("solarized")
end

return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  ---@type nord.config
  opts = { transparent = { enabled = isTransparent } },
  config = function(_, opts)
    vim.o.termguicolors = true
    vim.o.background = "dark"
    require("nord").setup(opts)
    vim.cmd.colorscheme("nord")
    vim.keymap.set("n", "<leader>t", toggleTransparent, { desc = "Toggle transparent background" })
  end,
}
