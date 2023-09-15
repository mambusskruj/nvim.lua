return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				icons_enabled = false,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "FugitiveHead", "diff", "diagnostics" },
				lualine_c = { "" },
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "fugitive", "quickfix", "lazy", "nvim-dap-ui", "symbols-outline", "toggleterm" },
		})
	end,
}
