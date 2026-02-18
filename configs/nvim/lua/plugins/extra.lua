return {
	-- Inline diagnostics
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "powerline",
				options = {
					multilines = {
						enabled = true,
						always_show = true,
					},
					break_line = {
						enabled = false,
						after = 20,
					},
					overflow = {
						mode = "wrap",
						padding = 8,
					},
					show_all_diags_on_cursorline = true,
					enable_on_insert = false,
				},
			})
		end,
	},

	-- Fidget
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			progress = {
				suppress_on_insert = true,
			},
			notification = {
				override_vim_notify = true,
			},
		},
	},

	-- Todo Commnets
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Mini Move
	{
		"nvim-mini/mini.move",
		version = "*",
		config = function()
			require("mini.move").setup()
		end,
	},

	-- Mini Surround
	{
		"nvim-mini/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},

	-- Nvim Highlight colors
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
}
