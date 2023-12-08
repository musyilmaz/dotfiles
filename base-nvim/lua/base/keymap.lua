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
set_keymap("n", "<leader>w", ":w<cr>", opts)

-- shift lines in vertical axis
-- set_keymap("n"               , "<S-j>"     , ":m +1<CR>"              , opts)
-- set_keymap("n"               , "<S-k>"     , ":m -2<CR>"              , opts)
set_keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
set_keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Toggle NeoTree with focus
set_keymap("n", "<leader>e", ":NeoTreeFocusToggle<cr>", opts)

-- toggle trouble
set_keymap("n", "<leader>tt", "<cmd>TroubleToggle<cr>", opts)
set_keymap("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", opts)

-- telescope
local telescope_builtin = require("telescope.builtin")

set_keymap("n", "<leader>ff", telescope_builtin.find_files, opts)
set_keymap("n", "<leader>fe", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
set_keymap("n", "<leader>fg", telescope_builtin.live_grep, opts)

-- gitsigns
local gs = package.loaded.gitsigns

set_keymap("n", "<leader>hs", gs.stage_hunk, opts)
set_keymap("n", "<leader>hr", gs.reset_hunk, opts)
set_keymap("v", "<leader>hs", function()
  gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, opts)
set_keymap("v", "<leader>hr", function()
  gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, opts)
set_keymap("n", "<leader>hS", gs.stage_buffer, opts)
set_keymap("n", "<leader>hu", gs.undo_stage_hunk, opts)
set_keymap("n", "<leader>hR", gs.reset_buffer, opts)
set_keymap("n", "<leader>hp", gs.preview_hunk, opts)

-- undotree
set_keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
