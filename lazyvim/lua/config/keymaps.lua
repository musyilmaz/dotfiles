-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set_keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
set_keymap("n", "<C-h>", "<C-w>h", opts)
set_keymap("n", "<C-j>", "<C-w>j", opts)
set_keymap("n", "<C-k>", "<C-w>k", opts)
set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Disabling Arrow keys --
set_keymap("n", "<Left>", ":echoe 'use h'<cr>", opts)
set_keymap("n", "<Right>", ":echoe 'use l'<cr>", opts)
set_keymap("n", "<Up>", ":echoe 'use k'<cr>", opts)
set_keymap("n", "<Down>", ":echoe 'use j'<cr>", opts)
set_keymap("i", "<Left>", "<ESC>:echoe 'use h'<cr>", opts)
set_keymap("i", "<Right>", "<ESC>:echoe 'use l'<cr>", opts)
set_keymap("i", "<Up>", "<ESC>:echoe 'use k'<cr>", opts)
set_keymap("i", "<Down>", "<ESC>:echoe 'use j'<cr>", opts)

-- sane insert mode movements
-- Exit out insert mode with jk and write buffer
set_keymap("i", "jk", "<ESC>:w<cr>", opts)
-- Move cursor to the next space between characters with ;'
set_keymap("i", ";'", "<ESC>la", opts)
-- Move cursor to the previous space between characters with ';
set_keymap("i", "';", "<ESC>i", opts)

-- Write buffer with leader w
set_keymap("n", "<leader>w", ":w<cr>", opts)

-- split window
set_keymap("n", "ss", ":split<cr>", opts)
set_keymap("n", "sv", ":vsplit<cr>", opts)

-- Diagnostics
set_keymap("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)

set_keymap("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end)
