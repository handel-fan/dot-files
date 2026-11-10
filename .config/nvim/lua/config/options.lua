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
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})
