return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local tree = require("nvim-treesitter")

			tree.install({
				"lua",
				"markdown",
				"markdown_inline",
				"make",
				"vim",
				"javascript",
				"python",
				"bash",
				"css",
				"diff",
				"dockerfile",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"html",
				"json",
				"terraform",
				"toml",
				"typescript",
				"wgsl",
				"yaml",
				"vimdoc",
			})
		end,
	},
}
