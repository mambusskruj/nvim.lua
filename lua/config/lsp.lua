vim.lsp.enable("luals")
vim.lsp.enable("ansiblels")
vim.lsp.enable("ruff")
vim.lsp.enable("bashls")
vim.lsp.enable("dockerls")
vim.lsp.enable("docker_compose_language_service")
vim.lsp.enable("eslint")
vim.lsp.enable("groovyls")
vim.lsp.enable("helm_ls")
vim.lsp.enable("html")
vim.lsp.enable("jsonls")
vim.lsp.enable("terraformls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("taplo")
vim.lsp.enable("marksman")
vim.lsp.enable("harper_ls")
vim.lsp.enable("basedpyright")
vim.lsp.config("yamlls")

vim.lsp.on_attach(function(client, bufnr)
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
