return {
	{
		"zbirenbaum/copilot.lua",
		lazy = false,
		opts = {
			filetypes = {
				gitcommit = true,
				NeogitCommitMessage = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<leader>j",
					accept_word = false,
					accept_line = false,
					next = "<leader>d",
					prev = "<leader>s",
					dismiss = "<leader>a",
				},
			},
		},
	},
}
