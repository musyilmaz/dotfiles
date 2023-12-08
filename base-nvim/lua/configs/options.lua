-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Neovim options
local options = {
  backup         = false,
  clipboard      = "unnamedplus",
  cmdheight      = 1,
  completeopt    = { "menuone", "noselect" },
  fileencoding   = "utf-8",
  hlsearch       = true,
  ignorecase     = true,
  mouse          = "a",
  pumheight      = 10,
  showmode       = false,
  showtabline    = 2,
  smartcase      = true,
  smartindent    = true,
  splitbelow     = true,
  splitright     = true,
  swapfile       = false,
  termguicolors  = true,
  undofile       = true,
  updatetime     = 300,
  writebackup    = false,
  expandtab      = true,
  shiftwidth     = 2,
  tabstop        = 2,
  cursorline     = true,
  number         = true,
  relativenumber = true,
  numberwidth    = 4,
  signcolumn     = "yes",
  wrap           = false,
  scrolloff      = 8,
  sidescrolloff  = 8,
  guifont        = "monospace:h17",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
