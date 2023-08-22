return {
	"folke/twilight.nvim",
	lazy = false,
	config = function()
		require("twilight").setup({
			expand = {
				"function",
				"method",
				"table",
				"if_statement",
				"for_statement",
				"while_statement",
			},
			exclude = {
				"NeogitCommitMessage",
			},
		})
		vim.cmd([[ TwilightEnable ]])
	end,
}
