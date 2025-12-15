-- Add numbers to each line on the left-hand side
vim.opt.nu = true
vim.opt.relativenumber = true

-- Highlight cursor line underneath the curso horizontally
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.guicursor = ""

-- Set tab with to 4 columns
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Set shfitwidth to 4 spaces
vim.opt.shiftwidth = 4

-- Use space characters instead of tabs
vim.opt.expandtab = true

-- Use clike smart intending
vim.opt.smartindent = true

-- Do not let cursor scroll below or above N number of lines when scrolling
vim.opt.scrolloff = 10

-- do not wrap lines, allow long lines to extend as far as the line goes
vim.opt.wrap = true
-- 󱞥   󱞩
vim.opt.showbreak = "󱞩"


-- While searching trough a file incrementally highlight matching characters as you type
vim.opt.incsearch = true
-- Ignore cases while searching, yet allow searching for capital letters
vim.opt.smartcase = true

-- Ignore case when completing file names
vim.opt.fileignorecase = true

-- show partial command you type in the last line of the screen
vim.opt.showcmd = true

-- Enable auto completion menu after pressing TAB
vim.opt.wildmenu = true

vim.opt.hidden = true

vim.opt.foldmethod = indent

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes:1"
vim.opt.isfname:append("@-@")

--vim.opt.colorcolumn = "80"

-- Set persistant undo
vim.opt.undofile = true

-- Set timeout for leaderkey
vim.opt.timeout = false
