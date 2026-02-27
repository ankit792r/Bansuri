return {
	-- Rose pine colorscheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				varient = "main",
				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				numhl = true,
				current_line_blame = true,
			})
		end,
	},

	-- Treesitter config
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- Auto Save
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0",
		cmd = "ASToggle",
		event = { "InsertLeave", "TextChanged" },
		opts = {
			enabled = true,
			execute_message = {
				enabled = true,
				message = function()
					return ("saved at " .. vim.fn.strftime("%H:%M:%S"))
				end,
				dim = 0.18,
				cleaning_interval = 1250,
			},
			trigger_events = { -- See :h events
				immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
				defer_save = { "InsertLeave", "TextChanged" },
				cancel_deferred_save = { "InsertEnter" },
			},
			condition = nil,
			write_all_buffers = false,
			noautocmd = false,
			lockmarks = false,
			debounce_delay = 1500,
			debug = false,
		},

		-- harpoon
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				local harpoon = require("harpoon")
				harpoon:setup()

				vim.keymap.set("n", "<M-i>", function()
					harpoon:list():add()
				end)

				vim.keymap.set("n", "<M-o>", function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end)

				vim.keymap.set("n", "<M-q>", function()
					harpoon:list():select(1)
				end)
				vim.keymap.set("n", "<M-w>", function()
					harpoon:list():select(2)
				end)
				vim.keymap.set("n", "<M-e>", function()
					harpoon:list():select(3)
				end)
				vim.keymap.set("n", "<M-a>", function()
					harpoon:list():select(4)
				end)

				vim.keymap.set("n", "<M-s>", function()
					harpoon:list():select(5)
				end)

				vim.keymap.set("n", "<M-d>", function()
					harpoon:list():select(6)
				end)

				vim.keymap.set("n", "<M-z>", function()
					harpoon:list():select(7)
				end)

				vim.keymap.set("n", "<M-x>", function()
					harpoon:list():select(8)
				end)

				vim.keymap.set("n", "<M-c>", function()
					harpoon:list():select(9)
				end)
			end,
		},
	},
}
