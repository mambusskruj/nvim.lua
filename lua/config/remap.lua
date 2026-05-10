-- vim.g.mapleader = "\\"
vim.g.mapleader = " "
vim.g.maplocalleader = "."

-- move blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center oriented navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

-- do not replace copied text by default
vim.keymap.set("x", "p", "P", {
  noremap = true,
  silent = true,
  desc = "Paste over selection without overwriting register",
})

-- original Vim/Neovim visual paste behavior with replacing text in register
vim.keymap.set("x", "<C-p>", "p", {
  noremap = true,
  silent = true,
  desc = "Paste over selection and overwrite register",
})

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- terminal
vim.keymap.set("n", "<leader>T", "<cmd>tabnew | term<cr>i")

-- quickfixlist
vim.keymap.set("n", "<C-s>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<C-a>", "<cmd>cprev<cr>zz")

-- Disable arrow buttons navigation for take use to hjkl
vim.keymap.set("n", "<Up>", "<NOP>")
vim.keymap.set("n", "<Down>", "<NOP>")
vim.keymap.set("n", "<Left>", "<NOP>")
vim.keymap.set("n", "<Right>", "<NOP>")

-- ESC for remove search highligh
vim.keymap.set("n", "<esc><esc>", "<cmd>noh<return><esc>", { silent = true })

-- in terminal mode press esc or ctrl+[ to go back to normal mode
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Tab switching
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leader>1", "<cmd>tabn 1<cr>")
vim.keymap.set("n", "<leader>2", "<cmd>tabn 2<cr>")
vim.keymap.set("n", "<leader>3", "<cmd>tabn 3<cr>")
vim.keymap.set("n", "<leader>4", "<cmd>tabn 4<cr>")
vim.keymap.set("n", "<leader>5", "<cmd>tabn 5<cr>")

-- Close current tab aka close all windows in tab
vim.keymap.set("n", "<C-w>C", "<cmd>tabclose<CR>", {
  desc = "Close current tab aka close all windows in tab",
})

vim.keymap.set("n", "<leader>f", "<cmd>Oil --float <cr>")
vim.keymap.set("n", "<leader>F", "<cmd>Oil --float ./<cr>")
