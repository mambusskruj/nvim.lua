-- I use it only for markdown files, where I create links from selected text with 'Si'
return {
	"kylechui/nvim-surround",
	version = "*",
	ft = { "markdown" },
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
