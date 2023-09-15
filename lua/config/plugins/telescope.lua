return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			{ "nvim-telescope/telescope-live-grep-args.nvim", build = "make" },
		},
		keys = {
			{
				"<leader>o",
				function()
					require("telescope.builtin").git_files()
				end,
				noremap = true,
			},
			{
				"<leader>'",
				function()
					require("telescope.builtin").find_files()
				end,
				noremap = true,
			},
			{
				"<leader>[",
				function()
					require("telescope").extensions.live_grep_args.live_grep_args()
				end,
				noremap = true,
			},
			{
				"<leader>;",
				function()
					require("telescope.builtin").grep_string()
				end,
				noremap = true,
			},
			{
				"<leader>;",
				function()
					require("telescope.builtin").grep_string()
				end,
				noremap = true,
				mode = "v",
			},
			{
				"<leader>]",
				function()
					require("telescope.builtin").buffers()
				end,
				noremap = true,
			},
			{
				"<leader>l",
				function()
					require("telescope.builtin").lsp_references()
				end,
				noremap = true,
			},
			{
				"<leader>s",
				function()
					require("telescope.builtin").search_history()
				end,
				noremap = true,
			},
			{
				"<leader>c",
				function()
					require("telescope.builtin").command_history()
				end,
				noremap = true,
			},
		},
		opts = {
			defaults = {
				initial_mode = "insert", -- can be 'insert' and 'normal'
				wrap_results = true,
				winblend = 0,
				border = true,
				layout_strategy = "vertical",
				layout_config = {
					width = 0.9,
					-- preview_width = 0.45, -- only for horizontal layout
					scroll_speed = 5,
				},
				scroll_speed = 5,
				scroll_strategy = "limit",
				preview = { filesize_limit = 1 },

				-- for find_files
				find_command = {
					"rg",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"column",
					"--smart-case",
					"--hidden",
				},

				-- for live_grep and string_grep
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},

				file_ignore_patterns = { ".git/", "node_modules/", ".env/" },
				path_display = { "truncate" },

				mappings = {
					n = { -- normal mode (i for insert mode)
						["<C-c>"] = function(...)
							require("telescope.actions").close(...)
						end,
						["<Space>c"] = function(...)
							require("telescope.actions").send_selected_to_qflist(...)
							require("telescope.actions").open_qflist(...)
						end,
					},
					i = {
						["<S-Down>"] = function(...)
							require("telescope.actions").cycle_history_next(...)
						end,
						["<S-Up>"] = function(...)
							require("telescope.actions").cycle_history_prev(...)
						end,
					},
				},
			},

			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
				},

				grep_string = {
					only_sort_text = true,
					max_results = 30,
					hidden = true,
				},

				live_grep = {
					only_sort_text = true,
					max_results = 30,
					hidden = true,
				},

				buffers = {
					ignore_current_buffer = true,
					sort_mru = true,
					initial_mode = "insert", -- can be 'insert' and 'normal'
				},
			},
		},

		config = function(_, opts)
			local _, telescope = pcall(require, "telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")
		end,
	},
}
