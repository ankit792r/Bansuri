return {
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
}
