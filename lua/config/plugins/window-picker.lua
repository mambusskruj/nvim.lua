return {
	"s1n7ax/nvim-window-picker",
	version = "v2.*",
	config = function()
		local picker = require("window-picker")
		picker.setup({
			-- fg_color = "#000000"
			-- hint = "floating-big-letter",
			picker_config = {
				statusline_winbar_picker = {
					use_winbar = "smart",
				},
				show_prompt = false,
			},
			highlights = {
				statusline = {
					focused = {
						fg = "#ededed",
						bg = "#363a4f",
						bold = true,
					},
					unfocused = {
						fg = "#ededed",
						bg = "#363a4f",
						bold = true,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ww", function()
			local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
			vim.api.nvim_set_current_win(picked_window_id)
		end, { desc = "Pick a window" })
	end,
}
