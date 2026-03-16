return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
		},
	},
	keys = function()
		local harpoon = require("harpoon")
		local keys = {
			-- Open the UI menu
			{
				"<M-o>",
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon Menu",
			},

			-- Clear the entire list
			{
				"<M-p>",
				function()
					local confirm = vim.fn.confirm("Clear Harpoon list?", "&Yes\n&No", 2)
					if confirm == 1 then
						harpoon:list():clear()
						print("Harpoon: List Cleared")
					end
				end,
				desc = "Harpoon Clear List",
			},

			-- Insert entry into list
			{
				"<M-i>",
				function()
					harpoon:list():add()
				end,
				desc = "Harpoon Assign Key",
			},
		}

		-- Mapping Meta + q,w,e,a,s,d,f to positions 1 through 7
		local harpoon_keys = { "q", "w", "e", "a", "s", "d", "f" }
		for i, key in ipairs(harpoon_keys) do
			table.insert(keys, {
				"<M-" .. key .. ">",
				function()
					harpoon:list():select(i)
				end,
				desc = "Harpoon to File " .. i,
			})
		end

		return keys
	end,
}
