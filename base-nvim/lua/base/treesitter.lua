---
-- treesitter
---
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"astro",
		"lua",
		"bash",
		"css",
		"dockerfile",
		"html",
		"javascript",
		"markdown",
		"prisma",
		"python",
		"scss",
		"typescript",
		"tsx",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = false,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		query = "rainbow-parens",
		strategy = require("ts-rainbow").strategy.global,
	},
	autotag = { enable = true },
	context_commentstring = { enable = true },
})

---
-- treesitter-context
---
require("treesitter-context").setup({
	enable = true,
	max_lines = 0,
	min_window_height = 0,
	line_numbers = true,
	multiline_threshold = 20,
	trim_scope = "outer",
	mode = "cursor",
	separator = nil,
	zindex = 20,
})
