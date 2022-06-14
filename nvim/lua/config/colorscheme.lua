vim.o.background = "dark" -- or "light" for light mode

-- local colorscheme = "gruvbox-material"
-- local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
local colorscheme = "gruvbox-baby"
-- local colorscheme = 'neon'
-- local colorscheme = 'codedark'
-- local colorscheme = 'nord'
-- local colorscheme = 'material'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
