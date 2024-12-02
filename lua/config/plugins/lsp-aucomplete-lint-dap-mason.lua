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
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("lsp_signature").setup({
				hint_enable = false,
			})
		end,
	}, -- hints as you type
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

	--- YAML AND KUBERNETES
	--- Builtin Kubernetes manifest autodetection
	{
		"someone-stole-my-name/yaml-companion.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	},

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
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
		init = function()
			local lsp = require("lsp-zero").preset({})

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
				local opts = { noremap = true, silent = true }
				local keymap = vim.api.nvim_buf_set_keymap
				keymap(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				keymap(bufnr, "n", "gA", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				keymap(bufnr, "n", "gF", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
				keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
				keymap(bufnr, "n", "gp", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
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
					"ansiblels",
					"bashls",
					"docker_compose_language_service",
					"dockerls",
					"eslint",
					"ltex",
					-- "groovyls",
					"helm_ls",
					"html",
					"jsonls",
					"terraformls",
					"ts_ls",
					"yamlls",
					"basedpyright",
					"ruff",
					"taplo",
					"marksman",
				},
			})

			-- Here we can add custom settings for each LSP
			--
			local lsp_config = require("lspconfig")

			-- default setups
			lsp_config.ansiblels.setup({})
			lsp_config.ruff.setup({})
			lsp_config.bashls.setup({})
			lsp_config.dockerls.setup({})
			lsp_config.docker_compose_language_service.setup({})
			lsp_config.eslint.setup({})
			lsp_config.groovyls.setup({})
			lsp_config.helm_ls.setup({})
			lsp_config.html.setup({})
			lsp_config.jsonls.setup({})
			lsp_config.terraformls.setup({})
			lsp_config.ts_ls.setup({})
			lsp_config.taplo.setup({})
			lsp_config.marksman.setup({})
			lsp_config.basedpyright.setup({
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "off",
						},
					},
				},
			})
			--

			-- lsp_config.pylsp.setup({
			-- 	settings = {
			-- 		pylsp = {
			-- 			plugins = {
			-- 				pycodestyle = {
			-- 					ignore = {
			-- 						"E501", -- conflict with ruff: line too long
			-- 						"W503", -- conflict with ruff: line break before binary operator
			-- 					},
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- })
			lsp_config.lua_ls.setup(lsp.nvim_lua_ls())

			local spell_words = {}
			for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
				table.insert(spell_words, word)
			end

			lsp_config.ltex.setup({
				settings = {
					ltex = {
						language = "en-US",
						enabled = false,
						dictionary = {
							["en-US"] = spell_words,
						},
					},
					filetypes = {
						"markdown",
						"text",
						"gitcommit",
					},
				},
			})

			local cfg = require("yaml-companion").setup({
				settings = {
					yaml = {
						customTags = {
							"!reference",
							"!reference sequence",
						},
						schemas = {
							["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
								".gitlab-ci.yml",
								"gitlab-ci/**/*.yml",
								"templates/**/*.yml",
								"templates/*.yml",
								"stages/**/*.yml",
								"jobs/**/*.yml",
								-- "{templates, stages, jobs}/**/*.{yml, yaml}",
							},
						},
					},
				},
			})

			lsp_config.yamlls.setup(cfg)
			--
			--

			require("lsp-zero").extend_cmp()

			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_snipmate").load()

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
							nvim_lua = "[Lua]",
							luasnip = "[Snip]",
						})[entry.source.name]
						return vim_item
					end,
				},

				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip" },
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
			require("lint").linters_by_ft = {
				-- python = { "ruff" },
				json = { "jsonlint" },
			}
		end,
	},

	-- DAP

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "nvim-neotest/nvim-nio" },
		},
		config = function()
			-- require("dap.ext.vscode").load_launchjs()
			local sign = vim.fn.sign_define
			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("python")
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

			-- from the workspace root
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
