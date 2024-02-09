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
		branch = "v3.x",
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
			local lsp_config = require("lspconfig")

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
				local opts = { noremap = true, silent = true }
				local keymap = vim.api.nvim_buf_set_keymap
				keymap(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				keymap(bufnr, "n", "gA", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				keymap(bufnr, "n", "gF", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
				keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
				keymap(bufnr, "n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
				keymap(bufnr, "n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
				keymap(bufnr, "n", "gh", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

				-- disable virtual text
				vim.diagnostic.config({
					virtual_text = false,
				})
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"grammarly",
					"ansiblels",
					"bashls",
					"docker_compose_language_service",
					"dockerls",
					"eslint",
					"grammarly",
					"groovyls",
					"helm_ls",
					"html",
					"jsonls",
					"terraformls",
					"tsserver",
					"yamlls",
					"pyright",
					"ruff_lsp",
					"taplo",
				},
			})

			-- Here we can add custom settings for each LSP
			local lsp_config = require("lspconfig")
			lsp_config.lua_ls.setup(lsp.nvim_lua_ls())
			lsp_config.grammarly.setup({
				filetypes = {
					"markdown",
					"text",
					"NeogitCommitMessage",
					"gitcommit",
				},
			})
			lsp_config.yamlls.setup({
				settings = {
					yaml = {
						customTags = {
							"!reference sequence",
						},
						schemas = {
							["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
								".gitlab-ci.{yml, yaml}",
								"gitlab-ci/**/*.{yml, yaml}",
							},
						},
					},
				},
			})

			require("lsp-zero").extend_cmp()

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

				-- `/` cmdline setup.
				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				}),

				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
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

	{
		"mfussenegger/nvim-lint",
		config = function()
			-- update with new args
			local ruff = require("lint").linters.ruff

			new_args = {
				"--select",
				"ALL",
				"--no-cache",
			}
			ruff_args = {}
			n = 0
			for _, v in ipairs(new_args) do
				n = n + 1
				ruff_args[n] = v
			end
			for _, v in ipairs(ruff.args) do
				n = n + 1
				ruff_args[n] = v
			end

			ruff.args = ruff_args
			--

			require("lint").linters_by_ft = {
				python = { "ruff" },
				json = { "jsonlint" },
			}
		end,
	},

	-- DAP

	{
		"mfussenegger/nvim-dap",
		config = function()
			local sign = vim.fn.sign_define
			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup()
		end,
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
			{
				"<leader>B",
				"<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
				noremap = true,
				silent = true,
			},
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
					size = 60,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.4 },
						{ id = "console", size = 0.6 },
					},
					size = 20,
					position = "bottom",
				},
			},
			size = 65,
			position = "left", -- Can be "left", "right", "top", "bottom"
			expand_lines = false,
		},
		init = function()
			local dap, dapui = require("dap"), require("dapui")

			-- local cwd = vim.fn.getcwd()
			require("dap.ext.vscode").load_launchjs("./launch.json")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({ reset = true })
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
