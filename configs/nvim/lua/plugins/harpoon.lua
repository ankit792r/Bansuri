return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = false,
				sync_on_ui_close = false,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		vim.keymap.set("n", "<A-i>", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<A-o>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

		vim.keymap.set("n", "<A-q>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-w>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-e>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-a>", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<A-s>", function()
			harpoon:list():select(5)
		end)
		vim.keymap.set("n", "<A-d>", function()
			harpoon:list():select(6)
		end)
	end,
}
