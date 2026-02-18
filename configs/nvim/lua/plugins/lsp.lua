return {
	-- Mason LSP
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		lazy = false,
		config = function()
			require("mason").setup({
				ui = { border = "single" },
			})
			require("mason-lspconfig").setup({
				auto_install = true,
				ensure_installed = { "lua_ls" },
			})
		end,
	},

	-- Nvim LSP
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		opts = function(_, opts)
			opts.diagnostics = opts.diagnostics or {}
			opts.diagnostics.virtual_text = false
		end,
		config = function()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>cR", function()
				vim.lsp.buf.rename(nil, { rename_file = true })
			end, {})

			vim.keymap.set("n", "gai", vim.lsp.buf.incoming_calls, {})
			vim.keymap.set("n", "gao", vim.lsp.buf.outgoing_calls, {})
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

			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
		end,
	},

	-- Ts Tools
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
