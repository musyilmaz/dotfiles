--
-- Bootstrap lazy package manager
--
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


--
-- import local neovim options
--
require("configs.options")

--
-- import plugins from lua/plugins folder
--
require("lazy").setup({ import = "plugins" })


-- import local neovim configurations
require("configs.keymap")
require("configs.colorscheme")
require("configs.editor")
require("configs.treesitter")
require("configs.git")
require("configs.lsp")
require("configs.telescope")
