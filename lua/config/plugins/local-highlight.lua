return {
	"tzachar/local-highlight.nvim",
	config = function()
		require("local-highlight").setup({
			hlgroup = "Search",
			animate = {
				enabled = false,
			},
		})
	end,
}
