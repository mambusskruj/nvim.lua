return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- {
	-- 	"preservim/vim-pencil",
	-- 	ft = { "markdown" },
	-- 	config = function()
	-- 		vim.fn["pencil#init"]({ wrap = "soft", spell = 0 })
	-- 	end,
	-- },
}
