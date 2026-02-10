return {
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
}
