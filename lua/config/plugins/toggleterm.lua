return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	version = "*",
	config = true,
	shade_terminals = false,
	keys = {
		{ "<leader>`", "<cmd>ToggleTerm direction=float<CR>", noremap = true },
	},
}
