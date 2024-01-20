return {
	"mhartington/formatter.nvim",
	lazy = false,
	config = function()
		require("formatter").setup({
			filetype = {
				json = {
					require("formatter.filetypes.json").jq,
				},
				python = {
					require("formatter.filetypes.python").ruff,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				-- yaml = {
				-- 	require("formatter.filetypes.yaml").yamlfmt,
				-- },
			},
		})
	end,
}
