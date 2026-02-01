return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			enabled = true,
			ui_select = true,
		},
	},
	sort_lastused = false,
	win = {
		input = {
			keys = {
				["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
				["<Esc>"] = "close",
			},
		},
		list = {
			keys = {
				["dd"] = "bufdelete",
				["<Esc>"] = "close",
			},
		},
	},

	keys = {
		{
			"<leader><leader>",
			function()
				Snacks.picker.files()
			end,
			desc = "Buffers",
		},

		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Files",
		},

		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},

		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},

		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
	},
}
