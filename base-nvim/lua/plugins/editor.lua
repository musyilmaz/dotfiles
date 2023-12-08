return {
	-- neo-tree.nvim
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	-- align lines
	{ "echasnovski/mini.align", version = false },
	-- mini pairs
	{ "echasnovski/mini.pairs", version = false },
	-- surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- barbar
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	-- bufdelete
	{ "famiu/bufdelete.nvim" },
	-- comment
	{ "numToStr/Comment.nvim" },
	-- indent blankline
	{ "lukas-reineke/indent-blankline.nvim" },
	-- undotree
	{ "mbbill/undotree" },
}
