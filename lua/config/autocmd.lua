-- remove whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.py,*.yml,*.yaml,*.sh,*.bash,Dockerfile,*.js,*.ts,*.lua,*.json",
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

-- Automatically load launch.json for debugging
-- I need it because I provide custom path to launch.json, so it do not reload file automatically
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("my-dap-launch.json", { clear = true }),
	pattern = "*/launch.json",
	callback = function(args)
		require("dap.ext.vscode").load_launchjs(args.file)
	end,
})
