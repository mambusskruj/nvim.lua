vim.g.mapleader = "\\"

-- move blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center oriented navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-w>o", "<C-w>ozz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- don't move coursor on the end of a line when concatenate with J key
vim.keymap.set("n", "J", "mzJ`z")

-- do not replace copied text
vim.keymap.set("x", "<C-p>", [["_dP]])

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>tabnew | term<cr>")

-- loclist

vim.keymap.set("n", "<Down>", "<cmd>lnext<cr>zz")
vim.keymap.set("n", "<Up>", "<cmd>lprev<cr>zz")

-- quickfixlist

vim.keymap.set("n", "<C-s>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<C-a>", "<cmd>cprev<cr>zz")

-- Doesn't work on Alacritty need to fix
-- function! ToggleQuickFix()
--     if empty(filter(getwininfo(), 'v:val.quickfix'))
--         copen
--     else
--         cclose
--     endif
-- endfunction
-- nnoremap <silent> <C-h> :call ToggleQuickFix()<cr>

-- Disable arrow buttons navigation for take use to hjkl
-- vim.keymap.set("n", "<Up>", "<NOP>")
-- vim.keymap.set("n", "<Down>", "<NOP>")
vim.keymap.set("n", "<Left>", "<NOP>")
vim.keymap.set("n", "<Right>", "<NOP>")

-- ESC for remove search highligh
vim.keymap.set("n", "<esc><esc>", "<cmd>noh<return><esc>", { silent = true })

-- browsing
vim.keymap.set("n", "<leader>f", "<cmd>Vex<cr>")
vim.keymap.set("n", "<leader>r", "<cmd>Lexplore<cr>")

-- in terminal mode press esc or ctrl+[ to go back to normal mode
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
