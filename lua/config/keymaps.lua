-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- remap ctrl+u/d to shift+u/d
vim.keymap.set(
  { "n", "v" },
  "<S-u>",
  "<C-u><cmd>lua vim.schedule(function() vim.cmd('normal! zz') end)<CR>",
  { desc = "Scroll up and recenter" }
)
vim.keymap.set(
  { "n", "v" },
  "<S-d>",
  "<C-d><cmd>lua vim.schedule(function() vim.cmd('normal! zz') end)<CR>",
  { desc = "Scroll down and recenter" }
)

-- go back
vim.keymap.set("n", "gb", "<C-o>", { desc = "Jump back in jumplist" })

-- move between splits
vim.keymap.set({ "n", "v" }, "<leader>j", "<C-w>j", { desc = "Move to split below" })
vim.keymap.set({ "n", "v" }, "<leader>k", "<C-w>k", { desc = "Move to split above" })
vim.keymap.set({ "n", "v" }, "<leader>h", "<C-w>h", { desc = "Move to split left" })
vim.keymap.set({ "n", "v" }, "<leader>l", "<C-w>l", { desc = "Move to split right" })
