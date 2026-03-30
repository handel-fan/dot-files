vim.g.snacks_animate = false

vim.opt.shortmess:append("A")

vim.opt.fillchars = {
	vert = "│",
	horiz = "─",
	horizup = "┴",
	horizdown = "┬",
	vertleft = "┤",
	vertright = "├",
	verthoriz = "┼",
}

local function set_split_highlights()
	vim.api.nvim_set_hl(0, "WinSeparator", {
		fg = "#666666",
		bold = true,
	})
end

set_split_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_split_highlights,
})
