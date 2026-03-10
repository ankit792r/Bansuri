return {
	-- Mason LSP
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		lazy = false,
		config = function()
			require("mason").setup({ ui = { border = "single" } })
			require("mason-lspconfig").setup({
				auto_install = true,
				ensure_installed = { "lua_ls", "pyright", "ts_ls" },
			})
		end,
	},

	-- Nvim LSP
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		opts = function(_, opts)
			opts.diagnostics = opts.diagnostics or {}
			opts.diagnostics.virtual_text = false -- Keeping your preference
			opts.diagnostics.severity_sort = true
		end,
		config = function()
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { desc = "LSP: " .. desc })
			end

			-- Navigation
			map("n", "K", vim.lsp.buf.hover, "Hover Doc")
			map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
			map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
			map("n", "gr", vim.lsp.buf.references, "Goto References")
			map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
			map("n", "gy", vim.lsp.buf.type_definition, "Type Definition")
			map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

			-- Actions & Refactoring
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
			map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>cR", function()
				vim.lsp.buf.rename(nil, { rename_file = true })
			end, "Rename File")

			-- Diagnostics (CRITICAL since virtual_text is off)
			map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
			map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

			map("n", "<leader>cd", function()
				vim.diagnostic.open_float({
					scope = "cursor",
					focusable = true, -- This allows you to 'tab' into the window and scroll
					border = "single",
				})
			end, "Show scrollable diagnostic")

			map("n", "<leader>cl", vim.diagnostic.setqflist, "LSP Quickfix List")

			-- Call Hierarchy
			map("n", "gai", vim.lsp.buf.incoming_calls, "Incoming Calls")
			map("n", "gao", vim.lsp.buf.outgoing_calls, "Outgoing Calls")
		end,
	},

	-- None LS
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "mason.nvim", "nvimtools/none-ls-extras.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.pylint,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.prettier,
					require("none-ls.diagnostics.eslint_d"),
				},
			})

			-- Formatting keymap
			vim.keymap.set("n", "<leader>cf", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "LSP: Format File" })
		end,
	},

	-- Inline diagnostics
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach", -- Load when LSP is active
		priority = 1000, -- Ensure it loads before other UI plugins
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "powerline",
				options = {
					-- 1. Enable floating window override
					-- This allows you to open a scrollable float for long errors
					override_open_float = true,

					-- 2. Multiline handling
					multilines = {
						enabled = true,
						always_show = true,
					},

					-- 3. Better wrapping for long messages
					break_line = {
						enabled = true, -- Changed to true for better readability
						after = 60, -- Wrap after 60 characters
					},

					-- 4. Behavior
					show_all_diags_on_cursorline = true,
					enable_on_insert = false, -- Keeps UI clean while typing

					-- 5. Appearance
					softwrap = 15, -- Adds slight indent to wrapped lines
				},
			})
		end,
	},
}
