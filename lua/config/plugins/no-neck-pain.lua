return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	opts = {
		width = 150,
		killAllBuffersOnDisable = true,
		autocmds = {
			enableOnVimEnter = false,
			toggle = false,
			toggleLeftSide = false,
			toggleRightSide = false,
			widthUp = false,
			widthDown = false,
			scratchPad = false,
		},
		buffers = {
			wo = {
				fillchars = "eob: ",
			},
		},
	},
}
