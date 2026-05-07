return {
	{
		"yorickpeterse/nvim-grey",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[set background=light]])
			vim.cmd([[colorscheme grey]])
		end,
	},
}
