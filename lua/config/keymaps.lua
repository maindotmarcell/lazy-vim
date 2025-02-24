-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- remap ctrl+u/d to shift+u/d
vim.keymap.set("n", "<S-u>", "<C-u>zz", { desc = "Scroll up and recenter" })
vim.keymap.set("n", "<S-d>", "<C-d>zz", { desc = "Scroll down and recenter" })

-- show hover info
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Show Hover Info" })

-- go back
vim.keymap.set("n", "gb", "<C-o>", { desc = "Jump back in jumplist" })
