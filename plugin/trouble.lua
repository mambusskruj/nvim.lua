vim.pack.add({ "https://github.com/folke/trouble.nvim" })
vim.keymap.set("n", "<leader>gt", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>gT", "<cmd>Trouble diagnostics toggle<cr>")
