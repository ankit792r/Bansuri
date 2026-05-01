return {
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
	},

	-- Outline
	{
		"hedyhli/outline.nvim",
		config = function()
			vim.keymap.set("n", "<leader>oc", "<cmd>OutlineClose<CR>", { desc = "Close Outline" })

			local outline = require("outline")
			outline.setup({
				outline_window = {
					width = 20,
					auto_width = {
						enabled = true,
						max_width = 25,
					},
					focus_on_open = false,
				},
			})

			vim.keymap.set("n", "<leader>ll", function()
				outline.open()
			end)

			-- vim.api.nvim_create_autocmd("VimEnter", {
			-- 	callback = function()
			-- 		outline.open()
			-- 	end,
			-- })
		end,
	},
}
