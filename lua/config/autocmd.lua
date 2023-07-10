-- -- remove whitespaces
-- vim.autocmd BufWritePre *.py,*.yml,*.yaml,*.sh,*.bash,Dockerfile,*.js,*.ts  :%s/\s\+$//e

-- -- set filetype bash to .lib (for SPARTA projects)
-- autocmd BufRead,BufNewFile *.lib set filetype=sh


-- remove whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py,*.yml,*.yaml,*.sh,*.bash,Dockerfile,*.js,*.ts",
    callback = function()
        vim.cmd ":%s/\s\+$//e"
    end,
})

-- set filetype bash to .lib (for SPARTA projects)
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
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

-- check grammar
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit,markdown",
    callback = function(opts)
        vim.api.nvim_create_autocmd('BufRead,InsertLeave', {
			buffer = opts.buf,
			command = 'GrammarousCheck --lang=en'
		})
    end,
})

-- check grammar for code comments
vim.api.nvim_create_autocmd("BufRead,BufWritePre", {
    pattern = "*.py,*.yml,*.yaml,*.sh,*.bash,Dockerfile,*.js,*.ts,*.lua,*java,*.groovy,*.toml",
    callback = function()
        vim.cmd ":GrammarousCheck --lang=en --comments-only"
    end,
})

