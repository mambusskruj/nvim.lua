vim.cmd.packadd("nvim.undotree")
require("undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<CR>")

vim.cmd.packadd("nvim.difftool")
require("difftool")
