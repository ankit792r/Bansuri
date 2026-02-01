return {
	"saghen/blink.cmp",
	build = "cargo +nightly build --release",
	version = "1.*",
	opts = {
		snippets = {
			preset = "default",
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			menu = {
				border = "single",
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = vim.g.ai_cmp,
				show_with_menu = true,
			},
		},

		fuzzy = {
			implementation = "prefer_rust",
		},

		signature = { enabled = true },
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
		},
	},
}
