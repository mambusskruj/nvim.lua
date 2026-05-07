vim.pack.add({ "https://github.com/tzachar/local-highlight.nvim" })
require("local-highlight").setup({
	hlgroup = "Search",
	animate = {
		enabled = false,
	},
})
