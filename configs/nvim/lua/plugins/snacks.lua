return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			enabled = true,
			matcher = {
				frecency = true,
			},
			layout = "telescope_like",
			layouts = {
				telescope_like = {
					reverse = true,
					layout = {
						box = "horizontal",
						border = "none",
						width = 0.8,
						height = 0.8,
						{
							box = "vertical",
							border = "none",
							{ win = "list", border = "single" },
							{
								win = "input",
								height = 1,
								border = "single",
							},
						},
						{
							win = "preview",
							border = "single",
							width = 0.55,
						},
					},
				},
			},
		},
		indent = {
			enabled = true,
			only_scope = true,
			animate = { enabled = false },
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
