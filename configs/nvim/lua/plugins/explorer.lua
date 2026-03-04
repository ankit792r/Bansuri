return {
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>e",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			floating_window_scaling_factor = 0.7,
			yazi_floating_window_border = "single",
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- mark netrw as loaded so it's not loaded at all.
			--
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			vim.g.loaded_netrwPlugin = 1
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local nvim_tree = require("nvim-tree")
			local api = require("nvim-tree.api")

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- nvim_tree.setup({
			-- 	sync_root_with_cwd = true,
			-- 	respect_buf_cwd = true,
			-- 	update_focused_file = {
			-- 		enable = true,
			-- 		update_cwd = true,
			-- 		update_root = true,
			-- 	},
			-- 	view = {
			-- 		width = 40,
			-- 		side = "left",
			-- 	},
			-- 	renderer = {
			-- 		group_empty = true,
			-- 	},
			-- 	git = {
			-- 		enable = true,
			-- 		ignore = false,
			-- 		timeout = 500,
			-- 	},
			-- })

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>e", function()
				api.tree.toggle({ find_file = true, update_root = true, focus = true })
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "<leader>gs", function()
				api.tree.git_status.show()
			end, opts)

			vim.keymap.set("n", "<leader>v", function()
				api.node.open.vertical()
			end, opts)

			vim.keymap.set("n", "<leader>h", function()
				api.node.open.horizontal()
			end, opts)

			vim.keymap.set("n", "<A-Right>", function()
				api.tree.resize({
					relative = 5,
				})
			end)

			vim.keymap.set("n", "<A-Left>", function()
				api.tree.resize({
					relative = -5,
				})
			end)
		end,
	},
}
