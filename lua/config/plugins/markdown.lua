return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	ft = { "markdown" },
	-- 	build = "cd app && yarn install",
	-- 	keys = {
	-- 		{ "<leader>v", "<cmd>MarkdownPreview<CR>", noremap = true, silent = true, mode = "n" },
	-- 	},
	--
	-- 	init = function()
	-- 		vim.api.nvim_exec(
	-- 			[[
	-- function OpenMarkdownPreview (url)
	--     execute "silent ! open -a Safari " . a:url
	-- endfunction
	-- ]],
	-- 			false
	-- 		)
	-- 		vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 		vim.g.mkdp_echo_preview_url = 1
	-- 	end,
	-- },
	-- {
	-- 	"preservim/vim-pencil",
	-- 	ft = { "markdown" },
	-- 	config = function()
	-- 		vim.fn["pencil#init"]({ wrap = "soft", spell = 0 })
	-- 	end,
	-- },
}
