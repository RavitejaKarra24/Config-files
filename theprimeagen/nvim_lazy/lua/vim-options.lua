-- Set space as the leader key
vim.g.mapleader = " "

-- Open netrw file explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- Map 'jk' to escape in insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Move selected lines down while staying in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines up while staying in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines and keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search navigation keeping cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over selection without copying the replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register (don't copy deleted text)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Map Ctrl-c to Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Open tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format buffer using LSP
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Navigate through quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Navigate through location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Quick access to Neovim config file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/init.lua<CR>");

-- Quick access to plugins directory
vim.keymap.set("n", "<leader>vpl", "<cmd>e ~/.config/nvim/lua/plugins/<CR>");

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("source %")
end)

