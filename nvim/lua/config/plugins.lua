local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

  use "sainnhe/gruvbox-material"
  use "luisiacc/gruvbox-baby"
	use "folke/tokyonight.nvim"
  use "tomasiser/vim-code-dark"
  
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use "williamboman/nvim-lsp-installer"
 	use "jose-elias-alvarez/null-ls.nvim"

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', 
    },
    tag = 'nightly' 
  }

  use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-file-browser.nvim"

	use "lewis6991/gitsigns.nvim"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'akinsho/bufferline.nvim', 
    tag = "v2.*", 
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use "moll/vim-bbye"

  use 'lewis6991/impatient.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
	use "JoosepAlviste/nvim-ts-context-commentstring"
  use "mickael-menu/zk-nvim"
  use { "ellisonleao/glow.nvim", branch = 'main' }
  use "sbdchd/neoformat"

end)
