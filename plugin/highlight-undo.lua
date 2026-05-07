vim.pack.add({ "https://github.com/tzachar/highlight-undo.nvim" })
require("highlight-undo").setup({
	duration = 300,
	undo = {
		hlgroup = "HighlightUndo",
		mode = "n",
		lhs = "u",
		map = "undo",
		opts = {},
	},
	redo = {
		hlgroup = "HighlightUndo",
		mode = "n",
		lhs = "<C-r>",
		map = "redo",
		opts = {},
	},
})
