-- Navigate through window
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<esc>", "<cmd>noh<CR>")
vim.keymap.set("n", "<leader>sr", ":%s/")
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Move cursor with Alt + hjkl in insert mode
vim.keymap.set("i", "<M-h>", "<C-o>h", { noremap = true, silent = true })
vim.keymap.set("i", "<M-j>", "<C-o>j", { noremap = true, silent = true })
vim.keymap.set("i", "<M-k>", "<C-o>k", { noremap = true, silent = true })
vim.keymap.set("i", "<M-l>", "<C-o>l", { noremap = true, silent = true })

-- Move cursor around words
vim.keymap.set("i", "<M-w>", "<C-o>w")
vim.keymap.set("i", "<M-e>", "<C-o>e")
vim.keymap.set("i", "<M-b>", "<C-o>b")
