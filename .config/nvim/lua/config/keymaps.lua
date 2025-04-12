-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>rp", ":w<CR>:!python3 %<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rb", ":w<CR>:!bash %<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>asp", "I#!<ESC>:read !which python3<CR>kJx", opts)
vim.api.nvim_set_keymap("n", "<leader>asf", "I#!<ESC>:read !which fish<CR>kJx", opts)
vim.api.nvim_set_keymap("n", "<leader>asb", "I#!<ESC>:read !which bash<CR>kJx", opts)
vim.api.nvim_set_keymap("i", "<C-l>", "<C-o>$", opts)
vim.api.nvim_set_keymap("v", "<C-d>", "<C-d>:normal! zz<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-u>", "<C-u>:normal! zz<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>:normal! zz<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>:normal! zz<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "gd:normal! zz<CR>", opts)
vim.api.nvim_set_keymap("n", "gI", "gI:normal! zz<CR>", opts)

-- return {
--   "echasnovski/mini.surround"
--   keys = {
--     "<leader>ga", "<"
--   }
-- }
