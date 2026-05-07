vim.pack.add({ "https://github.com/sindrets/diffview.nvim" })
require("diffview").setup({
	view = {
		default = {
			winbar_info = true,
		},
	},
	file_panel = {
		win_config = {
			width = 40,
		},
	},
})

vim.pack.add({ "https://github.com/aaronhallaert/advanced-git-search.nvim" })
require("telescope").setup({
	-- move this to the place where you call the telescope setup function
	extensions = {
		advanced_git_search = {
			-- See Config
		},
	},
})
require("telescope").load_extension("advanced_git_search")

vim.pack.add({ "https://github.com/tpope/vim-fugitive" })
vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>")
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //2<cr>")
vim.keymap.set("n", "<leader>gk", "<cmd>diffget //3<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>G blame<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Gclog<cr>")
vim.keymap.set("n", "<leader>gL", "<cmd>G fetch | G log  --decorate<cr>")

vim.pack.add({ "https://github.com/AndrewRadev/linediff.vim" })
