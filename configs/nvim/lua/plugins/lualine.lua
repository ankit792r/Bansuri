return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				section_separators = "",
				component_separators = "",
				disabled_filetypes = {
					"checkhealth",
					"snacks_dashboard",
					"NeogitConsole",
					"NeogitStatus",
					statusline = {},
					winbar = {},
				},
				theme = {
					normal = {
						a = { fg = "NONE", bg = "#575279" },
						b = { fg = "NONE", bg = "NONE" },
						c = { fg = "NONE", bg = "NONE" },
					},
					insert = { a = { fg = "NONE", bg = "#286983" } },
					visual = { a = { fg = "NONE", bg = "#907aa9" } },
					replace = { a = { fg = "NONE", bg = "#b4637a" } },
					inactive = {
						a = { fg = "NONE", bg = "NONE" },
						b = { fg = "NONE", bg = "NONE" },
						c = { fg = "NONE", bg = "NONE" },
					},
				},
			},
			refresh = { statusline = 60 },
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						path = 1, -- show relative path
						padding = { left = 1, right = 1 },
					},
				},
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = { "progress", "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
