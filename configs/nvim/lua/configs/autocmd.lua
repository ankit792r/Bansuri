-- :delm! | delm A-Z0-9
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Clear all marks (local + global)
		-- vim.cmd("delmarks! | delmarks A-Z0-9")

		-- Clear jumplist
		vim.cmd("clearjumps")
	end,
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
