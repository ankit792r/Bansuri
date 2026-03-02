-- 🔑 Leader key
vim.g.mapleader = " "

-- 🌐 Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- 🔢 Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- 📝 Tabs & Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true

-- 📜 Wrapping
vim.opt.wrap = false

-- 🔍 Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.gdefault = true

-- 💡 UI & Cursor
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- 🔙 Backspace
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.fillchars = { eob = " ", vert = " ", fold = " " }

-- 📋 Clipboard
vim.opt.clipboard:append("unnamedplus")

-- 🪟 Splits
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"

-- 🖱️ Mouse (disabled for keyboard-only users; change to 'a' if needed)
vim.opt.mouse = ""

-- 💾 Swap & Undo
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

vim.opt.splitright = true
vim.opt.splitbelow = true

-- 🧙 Persistent Sessions
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.wo.number = true
vim.opt.showmode = false
vim.opt.cmdheight = 0

vim.cmd([[ autocmd RecordingEnter * set cmdheight=1 ]])
vim.cmd([[ autocmd RecordingLeave * set cmdheight=0 ]])

-- ✨ Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- 🟨 Comment formatting
vim.opt.formatoptions:append({ "r" })

vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

vim.o.winborder = "single"
vim.lsp.set_log_level("off")

local max_w = math.floor(vim.o.columns * 0.6)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	max_width = max_w,
	max_height = 25,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	max_width = max_w,
})
