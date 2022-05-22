local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disabling Arrow keys --
keymap("n", "<Left>", ":echoe 'use h'<CR>", opts)
keymap("n", "<Right>", ":echoe 'use l'<CR>", opts)
keymap("n", "<Up>", ":echoe 'use k'<CR>", opts)
keymap("n", "<Down>", ":echoe 'use j'<CR>", opts)
keymap("i", "<Left>", "<ESC>:echoe 'use h'<CR>", opts)
keymap("i", "<Right>", "<ESC>:echoe 'use l'<CR>", opts)
keymap("i", "<Up>", "<ESC>:echoe 'use k'<CR>", opts)
keymap("i", "<Down>", "<ESC>:echoe 'use j'<CR>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Open 30 width Left Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Navigate between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close active buffer
keymap("n", "<leader>cb", ":Bdelete!<CR>", opts)

-- Format active buffer
keymap("n", "<leader>fd", "<Cmd>Neoformat<CR>", opts)
-- Save active buffer
keymap("n", "<leader>w", ":w<CR>", opts)

-- Insert --
-- Press jk fast to enter normal mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", ";'", "<ESC>la", opts)
keymap("i", "';", "<ESC>i", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Dont overwrite the yank buffer with the replaced register
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("n", "<S-j>", ":m +1<CR>", opts)
keymap("n", "<S-k>", ":m -2<CR>", opts)
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Telescope --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap(
	"n",
	"<leader>ff",
	"<cmd> lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>",
	opts
)
keymap("n", "<leader>fe", "<cmd> lua require'telescope'.extensions.file_browser.file_browser()<cr>", opts)
keymap(
	"n",
	"<leader>fb",
	"<cmd> lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown())<cr>",
	opts
)
keymap(
	"n",
	"<leader>fg",
	"<cmd> lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown())<cr>",
	opts
)

-- Gitsigns
keymap(
  "n",
  "<leader>ph",
  "<cmd> :GitSigns preview_hunk<cr>", opts
)

-- ZK
keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') } <CR>", opts)
keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } } <CR>", opts)
keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') } <CR>", opts)
keymap("n", "<leader>zt", "<Cmd>ZkTags <CR>", opts)
