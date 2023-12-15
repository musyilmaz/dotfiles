local trouble = require("trouble")
local telescope_builtin = require("telescope.builtin")

local set_keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


-- Better window navigation
set_keymap("n", "<C-h>", "<C-w>h", opts)
set_keymap("n", "<C-j>", "<C-w>j", opts)
set_keymap("n", "<C-k>", "<C-w>k", opts)
set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate between buffers
set_keymap("n", "<S-l>", ":bnext<cr>", opts)
set_keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Close active buffer
set_keymap("n", "<leader>cb", ":Bdelete!<cr>", opts)

-- Disabling Arrow keys --
set_keymap("n", "<Left>", ":echoe 'use h'<cr>", opts)
set_keymap("n", "<Right>", ":echoe 'use l'<cr>", opts)
set_keymap("n", "<Up>", ":echoe 'use k'<cr>", opts)
set_keymap("n", "<Down>", ":echoe 'use j'<cr>", opts)
set_keymap("i", "<Left>", "<ESC>:echoe 'use h'<cr>", opts)
set_keymap("i", "<Right>", "<ESC>:echoe 'use l'<cr>", opts)
set_keymap("i", "<Up>", "<ESC>:echoe 'use k'<cr>", opts)
set_keymap("i", "<Down>", "<ESC>:echoe 'use j'<cr>", opts)

-- Sane insert mode movements
-- Exit out insert mode with jk and write buffer
set_keymap("i", "jk", "<ESC>:w<cr>", opts)
-- Move cursor to the next space between characters with ;'
set_keymap("i", ";'", "<ESC>la", opts)
-- Move cursor to the previous space between characters with ';
set_keymap("i", "';", "<ESC>i", opts)

-- Write buffer with leader w
set_keymap("n", "<leader>s", ":w<cr>", opts)

-- shift lines in vertical axis
set_keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
set_keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Toggle Nvim-tree with focus
set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Trouble
set_keymap("n", "<leader>tt", ":TroubleToggle<cr>", opts)
set_keymap("n", "<leader>td", ":TroubleToggle document_diagnostics<cr>", opts)

-- Telescope
set_keymap("n", "<leader>ff", telescope_builtin.find_files, opts)
set_keymap("n", "<leader>fg", telescope_builtin.live_grep, opts)
set_keymap("n", "<leader>fb", telescope_builtin.buffers, opts)
set_keymap("n", "<leader>fs", telescope_builtin.lsp_document_symbols, opts)
set_keymap("n", "<leader>fd", telescope_builtin.diagnostics, opts)
