-- Set leader to space
vim.g.mapleader = " "

--vim.keymap.set("n", "j", "gj")
--vim.keymap.set("n", "k", "gk")

-- Go to netrw directories
vim.keymap.set("n", "<leader>mv", vim.cmd.Ex)

-- Add line bellow or above without going into insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")

-- Paste/delete with losing buffer (delete in _ buffer (gone))
vim.keymap.set({"n", "v"}, "<leader>P", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>D", [["_d]])

-- Yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])

-- Center cursor in screen after moving with C-d or C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center cursor in screen after moving with C-d or C-u
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Easier window movement
vim.keymap.set("n", "<leader>w", "<C-w>")

-- Quickly enable/disable searchhiglighting
vim.keymap.set("n", "<leader>H", ":set hlsearch<CR>")
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- Map Ctrl Backspace to delete entire word in insert mode (doesn't work)
vim.keymap.set("i", "<C-BS>", "<C-W>")

-- Format whole file without lsp (shift =) 
vim.keymap.set({"n", "x"}, "<leader>+", "mxggVG=`x")

-- Map Ctrl Backspace to delete entire word in insert mode (works)
vim.keymap.set("i", "", "<C-W>")


