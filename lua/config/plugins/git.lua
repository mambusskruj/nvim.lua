return {
	{
		"sindrets/diffview.nvim",
		config = function()
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
		end,
	},
	{
		"rhysd/git-messenger.vim",
		keys = {
			{ "<leader>gm", "<cmd>GitMessenger<cr>", noremap = true },
		},
		config = function()
			vim.g.git_messenger_include_diff = "current"
			vim.g.git_messenger_always_into_popup = true
		end,
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },
		config = function()
			-- optional: setup telescope before loading the extension
			require("telescope").setup({
				-- move this to the place where you call the telescope setup function
				extensions = {
					advanced_git_search = {
						-- See Config
					},
				},
			})

			require("telescope").load_extension("advanced_git_search")
		end,
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
		keys = {
			{ "<leader>gg", "<cmd>G<cr>", noremap = true },
			{ "<leader>gj", "<cmd>diffget //2<cr>", noremap = true },
			{ "<leader>gk", "<cmd>diffget //3<cr>", noremap = true },
			{ "<leader>gfr", "<cmd>G fetch | G rebase origin/master<cr>", noremap = true },
			{ "<leader>gb", "<cmd>G blame<cr>", noremap = true },
			{ "<leader>gl", "<cmd>Gclog<cr>", noremap = true },
			{ "<leader>gL", "<cmd>G fetch | G log  --decorate<cr>", noremap = true },
		},
	},
}
