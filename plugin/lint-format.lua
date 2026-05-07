-- linters (some LSP have linters, so no need to redefine it here)
vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })
require("lint").linters_by_ft = {
	json = { "jsonlint" },
}

-- formatters
vim.pack.add({ "https://github.com/mhartington/formatter.nvim" })
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
	},
})
