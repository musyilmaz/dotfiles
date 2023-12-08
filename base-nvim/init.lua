local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("configs.options")

require("lazy").setup({ import = "plugins" })
local base_utils = require("base.autocmd")
base_utils.empty_buff()

require("base.treesitter")
require("base.telescope")
require("base.lsp-zero")
require("base.editor")
require("base.git")

require("base.colorscheme")
require("base.keymap")
