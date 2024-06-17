return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "virtual",
			virtual_symbol = "■",

			---Highlight named colors, e.g. 'green'
			enable_named_colors = true,

			---Highlight tailwind colors, e.g. 'bg-blue-500'
			enable_tailwind = false,
		})
	end,
}
