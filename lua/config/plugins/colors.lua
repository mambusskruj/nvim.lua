return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			require("catppuccin").setup({
				no_bold = true,
				no_italic = true,
				integrations = {
					gitsigns = true,
					treesitter = true,
					markdown = true,
					mason = true,
					neogit = true,
					dap = {
						enabled = true,
						enable_ui = true, -- enable nvim-dap-ui
					},
					treesitter_context = true,
					symbols_outline = true,
					telescope = {
						enabled = true,
					},
				},
			})
			vim.cmd([[set background=dark]])
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"cideM/yui",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[let g:yui_lightline = v:true]])
			-- vim.cmd([[let g:yui_comments = 'bg']])
			-- vim.cmd([[let g:yui_line_numbers = 'fade']])
			-- vim.cmd([[colorscheme yui]])
		end,
	},
	{
		"mambusskruj/happy_hacking.vim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[set background=dark]])
			-- vim.cmd([[colorscheme happy_hacking]])
		end,
	},
}
