return {
	"tzachar/highlight-undo.nvim",
	lazy = false,
	opts = {
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
	},
}
