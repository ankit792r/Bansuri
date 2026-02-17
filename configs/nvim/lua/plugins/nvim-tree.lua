return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvim_tree = require("nvim-tree")
		local api = require("nvim-tree.api")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvim_tree.setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = true,
				update_root = true,
			},
			view = {
				width = 40,
				side = "left",
			},
			renderer = {
				group_empty = true,
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
		})

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
}
