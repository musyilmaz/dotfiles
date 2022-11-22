vim.o.background = "dark" -- or "light" for light mode

-- local colorscheme = "gruvbox-material"
-- local colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox-baby"
-- local colorscheme = 'neon'
-- local colorscheme = 'codedark'
-- local colorscheme = 'nord'
-- local colorscheme = 'material'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- require("catppuccin").setup({
-- 	transparent_background = false,
-- 	term_colors = false,
-- 	compile = {
-- 		enabled = false,
-- 		path = vim.fn.stdpath("cache") .. "/catppuccin",
-- 	},
-- 	dim_inactive = {
-- 		enabled = false,
-- 		shade = "dark",
-- 		percentage = 0.15,
-- 	},
-- 	styles = {
-- 		comments = { "italic" },
-- 		conditionals = { "italic" },
-- 		loops = {},
-- 		functions = {},
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 	},
-- 	integrations = {
-- 		-- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
-- 	},
-- 	color_overrides = {},
-- 	highlight_overrides = {},
-- })
--
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
