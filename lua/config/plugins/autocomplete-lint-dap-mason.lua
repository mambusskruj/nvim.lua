return {
	{
		"m-demare/hlargs.nvim",
		lazy = false,
		config = function()
			require("hlargs").setup({
				color = "#c4331d",
			})
		end,
	}, -- highlight arguments

	-- MASON and wrappers for it
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	-- LSP (works in pair with mason-lspconfig) and autocompletion
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason-lspconfig.nvim" },

	--- yaml autocomplete sources
	--- Builtin Kubernetes manifest autodetection
	{
		"cenk1cenk2/schema-companion.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("schema-companion").setup({})
		end,
	},

	-- Autocomplete
	{
		"saghen/blink.cmp",
		-- use a release tag to download pre-built binaries
		version = "1.*",

		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			-- Show sigrature help with C-k
			signature = { enabled = true },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	-- linters

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				json = { "jsonlint" },
			}
		end,
	},

	-- 	-- DAP
	--
	-- 	{
	-- 		"mfussenegger/nvim-dap",
	-- 		dependencies = {
	-- 			{ "nvim-neotest/nvim-nio" },
	-- 		},
	-- 		config = function()
	-- 			-- require("dap.ext.vscode").load_launchjs()
	-- 			local sign = vim.fn.sign_define
	-- 			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	-- 			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
	-- 			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
	-- 		end,
	-- 	},
	--
	-- 	-- {
	-- 	-- 	"mfussenegger/nvim-dap-python",
	-- 	-- 	config = function()
	-- 	-- 		require("dap-python").setup("python")
	-- 	-- 	end,
	-- 	-- },
	--
	-- 	{
	-- 		"rcarriga/nvim-dap-ui",
	-- 		keys = {
	-- 			{
	-- 				"<leader>q",
	-- 				"<cmd>lua require'dap'.close(); require'dapui'.toggle()<CR>",
	-- 				noremap = true,
	-- 				silent = true,
	-- 			},
	-- 			{ "<leader>e", "<cmd>lua require'dapui'.toggle()<CR>", noremap = true, silent = true },
	-- 			{ "<leader>w", "<cmd>lua require'dap'.continue()<CR>", noremap = true, silent = true },
	-- 			{ "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", noremap = true, silent = true },
	-- 			{
	-- 				"<leader>B",
	-- 				"<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	-- 				noremap = true,
	-- 				silent = true,
	-- 			},
	-- 		},
	-- 		opts = {
	-- 			layouts = {
	-- 				{
	-- 					elements = {
	-- 						-- Elements can be strings or table with id and size keys.
	-- 						{ id = "scopes", size = 0.4 },
	-- 						{ id = "breakpoints", size = 0.15 },
	-- 						{ id = "stacks", size = 0.25 },
	-- 						{ id = "watches", size = 0.20 },
	-- 					},
	-- 					size = 60,
	-- 					position = "left",
	-- 				},
	-- 				{
	-- 					elements = {
	-- 						{ id = "repl", size = 0.4 },
	-- 						{ id = "console", size = 0.6 },
	-- 					},
	-- 					size = 20,
	-- 					position = "bottom",
	-- 				},
	-- 			},
	-- 			size = 65,
	-- 			position = "left", -- Can be "left", "right", "top", "bottom"
	-- 			expand_lines = false,
	-- 		},
	-- 		init = function()
	-- 			local dap, dapui = require("dap"), require("dapui")
	--
	-- 			-- from the workspace root
	-- 			require("dap.ext.vscode").load_launchjs("./launch.json")
	--
	-- 			dap.listeners.after.event_initialized["dapui_config"] = function()
	-- 				dapui.open({ reset = true })
	-- 			end
	-- 			dap.listeners.before.event_terminated["dapui_config"] = function()
	-- 				dapui.close()
	-- 			end
	-- 			dap.listeners.before.event_exited["dapui_config"] = function()
	-- 				dapui.close()
	-- 			end
	-- 		end,
	-- 	},
}
