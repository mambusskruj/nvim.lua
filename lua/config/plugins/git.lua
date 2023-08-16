return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		opts = {
			disable_builtin_notifications = true,
		},
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
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{ "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", noremap = true },
			{ "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", noremap = true },
			{ "<leader>hh", "<cmd>Gitsigns setqflist", noremap = true },
			{ "<leader>h[", "<cmd>Gitsigns prev_hunk<cr>", noremap = true },
			{ "<leader>h]", "<cmd>Gitsigns next_hunk<cr>", noremap = true },
		},
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
				delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = "‾",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "-",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		},
	},
}
