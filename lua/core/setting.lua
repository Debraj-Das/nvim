-- Reset the mouse setting rom defaults
vim.o.mouse = "a"

-- Revert last positioned jump, as it is defined below
vim.cmd("aug vimStartup | au! | aug END")

-- Do not source defaults.vim again (after loading this system vimrc)
vim.g.skip_defaults_vim = 1

-- Set encoding to UTF-8
vim.o.encoding = "utf-8"

-- Set auto-indenting on for programming
vim.o.autoindent = true

-- Automatically show matching brackets
vim.o.showmatch = true

-- Turn on the "visual bell"
vim.o.visualbell = true

-- Show the current mode
vim.o.showmode = true

-- Better command line completion
vim.o.wildmode = "list:longest,longest:full"

-- Enable wildmenu
vim.o.wildmenu = true

-- Ignore specified file types during wildmenu completion
vim.o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"

-- Enable filetype detection
vim.cmd("filetype on")

-- Enable filetype-based indentation
vim.cmd("filetype indent on")

-- Even better autoindent (e.g., add indent after '{')
vim.o.smartindent = true

-- Disable backup files
vim.o.backup = false
vim.o.writebackup = false

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Set clipboard to unnamed and unnamedplus
vim.o.clipboard = "unnamed,unnamedplus"

-- Display line numbers
vim.wo.number = true

-- Display relative line numbers
vim.wo.relativenumber = true

-- Set backspace behavior
vim.o.backspace = "2"

-- Set laststatus to always display status line
vim.o.laststatus = 2

-- Automatically read changes made by other programs
vim.o.autoread = true

-- Set tabstop, shiftwidth, and softtabstop to 3
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.softtabstop = 3
vim.o.smarttab = true

-- Set foldmethod to manual (Fold the files as manual)
vim.o.foldmethod = "manual"

-- Add "**" to the search path
vim.o.path = vim.o.path .. ",**"

-- search settings
vim.o.hlsearch = true
vim.o.incsearch = true

-- scroll settings
vim.o.scrolloff = 8

-- do not swap files
vim.o.swapfile = false
vim.o.backup = false

-- set split window to open below and to the right
vim.o.splitbelow = true
vim.o.splitright = true
