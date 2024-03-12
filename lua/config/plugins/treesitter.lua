return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = true,
		opts = { mode = "cursor" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
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
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
			})
		end,
	},
}
