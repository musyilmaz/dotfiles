vim.o.background = "dark" -- or "light" for light mode

local colorscheme = "gruvbox-material"
-- local colorscheme = "tokyonight"
-- local colorscheme = 'gruvbox-baby'
-- local colorscheme = 'codedark'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
