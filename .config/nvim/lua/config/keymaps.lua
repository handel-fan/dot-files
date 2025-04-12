-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

local function copy_full_path()
  local full_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", full_path)
end

local function copy_filename()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg("+", filename)
end

_G.copy_full_path = copy_full_path
_G.copy_filename = copy_filename

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
vim.api.nvim_set_keymap("n", "<leader>ms", "ccset script_dir (dirname (status --current-filename))", opts)
vim.api.nvim_set_keymap("n", "<leader>fpa", "<cmd>lua copy_full_path()<CR>", { desc = "Copy full path to clipboard" })
vim.api.nvim_set_keymap("n", "<leader>fpf", "<cmd>lua copy_filename()<CR>", { desc = "Copy filename to clipboard" })
