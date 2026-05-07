-- remove whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.py",
		"*.yml",
		"*.yaml",
		"*.sh",
		"*.bash",
		"Dockerfile",
		"Dockerfile.*",
		"*.js",
		"*.ts",
		"*.tsx",
		"*.lua",
		"*.json",
		"*.tf",
		"*.tg",
		"*.env",
	},
	command = [[:%s/\s\+$//e]],
})

-- Try to lint after writing the whole buffer to a file.
-- Complements the built-in language server client for
-- languages where there are no language servers,
-- or where standalone linters provide better results.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- Try to format after writing the whole buffer to a file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = [[:FormatWrite]],
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 70,
		})
	end,
})

-- disable semantic highlightings because I use m-demare/hlargs.nvim
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

-- Keymaps for LSP clients
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufmap = function(mode, rhs, lhs)
			vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
		end

		-- These keymaps are the defaults in Neovim v0.11
		-- bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
		-- bufmap("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>")
		-- bufmap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>")
		-- bufmap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>")
		-- bufmap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		-- bufmap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
		-- bufmap({ "i", "s" }, "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

		-- These are custom keymaps
		-- bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		-- bufmap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
		-- bufmap("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>")
		-- bufmap({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")

		bufmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
		bufmap("n", "gA", "<cmd>lua vim.lsp.buf.code_action()<CR>")
		bufmap("n", "gF", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")

		bufmap("n", "gl", "<cmd>lua vim.diagnostic.setloclist()<CR>")
		bufmap("n", "gp", "<cmd>lua vim.diagnostic.setqflist()<CR>")
		bufmap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
		bufmap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
		bufmap("n", "gh", "<cmd>lua vim.diagnostic.open_float()<CR>")
	end,
})

-- Automatically load launch.json for debugging
-- I need it because I provide custom path to launch.json, so it do not reload file automatically
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("my-dap-launch.json", { clear = true }),
	pattern = "*/launch.json",
	callback = function(args)
		require("dap.ext.vscode").load_launchjs(args.file)
	end,
})

-- Treesitter-based highlights
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"python",
		"yaml",
		"gitcommit",
		"html",
		"markdown",
		"dockerfile",
		"typescriptreact",
		"typescript",
		"javascript",
		"sh",
		"toml",
		"terraform",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

-- disable native autocomplete for Telescope input
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.buftype == "nofile" or vim.bo.buftype == "" then
			vim.opt.autocomplete = false
			return
		end
		vim.opt.autocomplete = true
	end,
})
