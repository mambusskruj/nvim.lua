vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	float = {
		-- Padding around the floating window
		padding = 2,
		-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		max_width = 0.7,
		max_height = 0.7,
		border = nil,
		win_options = {
			winblend = 0,
		},
		-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
		get_win_title = nil,
		-- preview_split: Split direction: "auto", "left", "right", "above", "below".
		preview_split = "auto",
		-- This is the config that will be passed to nvim_open_win.
		-- Change values here to customize the layout
		override = function(conf)
			return conf
		end,
	},
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
		["<leader>f"] = { "actions.close", mode = "n" },
		["gd"] = {
			desc = "Toggle file detail view",
			callback = function()
				detail = not detail
				if detail then
					require("oil").set_columns({ "icon", "size", "mtime" })
				else
					require("oil").set_columns({ "icon" })
				end
			end,
		},
	},
})
