return {
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

	{ "williamboman/mason-lspconfig.nvim" },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required

			-- Autocompletion
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		init = function()
			local lsp = require("lsp-zero").preset({})

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.setup()

			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				-- completion = {
				--     autocomplete = false
				-- },

				formatting = {
					format = function(entry, vim_item)
						-- Source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[Snip]",
							nvim_lua = "[Lua]",
						})[entry.source.name]
						return vim_item
					end,
				},

				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
				},

				mapping = {
					["<C-n>"] = function()
						if cmp.visible() then
							cmp.close()
						else
							cmp.complete()
						end
					end,

					["<Up>"] = cmp.config.disable,
					["<Down>"] = cmp.config.disable,

					-- Use Tab and shift-Tab to navigate autocomplete menu
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end,

					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(0) then
							luasnip.jump(0)
						else
							fallback()
						end
					end,

					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
				},

				cmp.setup.cmdline(":", {
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}, {
						{ name = "buffer", max_item_count = 16 },
					}),
				}),
			})
		end,
	},

	-- linters

	{ "mfussenegger/nvim-lint" },

	-- DAP

	{
		"mfussenegger/nvim-dap",
		init = function()
			require("dap.ext.vscode").load_launchjs("${workspaceFolder}/launch.json")

			local sign = vim.fn.sign_define
			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = { "python" },
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		keys = {
			{
				"<leader>q",
				"<cmd>lua require'dap'.close(); require'dapui'.toggle()<CR>",
				noremap = true,
				silent = true,
			},
			{ "<leader>e", "<cmd>lua require'dapui'.toggle()<CR>", noremap = true, silent = true },
			{ "<leader>w", "<cmd>lua require'dap'.continue()<CR>", noremap = true, silent = true },
			{ "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", noremap = true, silent = true },
		},
		opts = {
			layouts = {
				{
					elements = {
						-- Elements can be strings or table with id and size keys.
						{ id = "scopes", size = 0.4 },
						{ id = "breakpoints", size = 0.15 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.20 },
					},
					size = 50,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.3 },
						{ id = "console", size = 0.7 },
					},
					size = 20,
					position = "bottom",
				},
			},
			size = 65,
			position = "left", -- Can be "left", "right", "top", "bottom"
		},
		init = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
