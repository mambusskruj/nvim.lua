-- remove whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.py,*.yml,*.yaml,*.sh,*.bash,Dockerfile,*.js,*.ts,*.lua",
	command = [[:%s/\s\+$//e]],
})

-- set filetype bash to .lib (for SPARTA projects)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.lib",
	callback = function()
		vim.opt.filetype = "sh"
	end,
})

-- Try to lint after writing the whole buffer to a file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- Try to format after writing the whole buffer to a file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = [[:FormatWrite]],
})

-- check grammar
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit,markdown",
	callback = function(opts)
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			buffer = opts.buf,
			command = [[:GrammarousCheck --lang=en]],
		})
	end,
})

-- -- check grammar for code comments
-- -- (c) It doesn't works on a unix environment
-- vim.api.nvim_create_autocmd({"BufWritePost"}, {
--     pattern = "*.py,*.yml,*.yaml,*.sh,*.bash,Dockerfile,*.js,*.ts,*.lua,*java,*.groovy,*.toml",
--     command = [[:GrammarousCheck --lang=en  --comments-only]]
-- })
