vim.g.skip_ts_context_commentstring_module = true

local treesitterConfigs = require("nvim-treesitter.configs")
local treesitterContext = require("treesitter-context")

treesitterConfigs.setup({
  ensure_installed = {
    "astro",
    "lua",
    "bash",
    "css",
    "dockerfile",
    "html",
    "javascript",
    "prisma",
    "scss",
    "typescript",
    "tsx"
  },
  sync_install = false,
  auto_install = true,
  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = false
  },
  incremental_selection = { enable = false },
  indent = { enable = true },
  autotag = { enable = true },
})

treesitterContext.setup({
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
