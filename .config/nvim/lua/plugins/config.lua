return {

	{ "EdenEast/nightfox.nvim" },
	{ "rcarriga/nvim-notify", enabled = false },
	{ "nvim-mini/mini.surround", enabled = true },
	{
		"nvim-mini/mini.files",
		enabled = true,
		keys = {
			{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Mini Files" },
			{ "<leader>E", "<cmd>lua MiniFiles.open()<cr>", desc = "Mini Files" },
		},
		opts = {
			options = {
				permanent_delete = false,
			},
		},
	},
	{ "mfussenegger/nvim-dap-python", enabled = true },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "Carbonfox",
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				typescript = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
		config = function(_, opts)
			require("copilot").setup(opts)
			vim.cmd("Copilot disable")
		end,
	},
	{
		"editorconfig/editorconfig-vim",
	},
	{ "glacambre/firenvim", build = ":call firenvim#install(0)" },
	{
		"stevearc/oil.nvim",
		keys = {
			{
				"<leader>o",
				function()
					require("oil").open()
				end,
				desc = "Open Oil",
			},
		},
		opts = {},
		lazy = false,
	},
	{
		"nvim-mini/mini.map",
		version = "*",
		config = function()
			local map = require("mini.map")

			map.setup({
				symbols = {
					encode = map.gen_encode_symbols.dot("4x2"),
				},
			})

			-- optional: open automatically
			map.open()

			-- toggle key
			vim.keymap.set("n", "<leader>mm", function()
				map.toggle()
			end, { desc = "Toggle minimap" })
		end,
	},
	{
		"gbprod/substitute.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"folke/flash.nvim",
		enabled = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader><space>", false },
			{ "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
		},
	},
}
