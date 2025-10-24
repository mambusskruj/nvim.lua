-- put your general Neovim configurations here
vim.g.mapleader = " "

vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

-- add kitty-scrollback.nvim to the runtimepath to allow us to require the kitty-scrollback module
-- pick a runtimepath that corresponds with your package manager, if you are not sure leave them all it will not cause any issues
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/lazy/kitty-scrollback.nvim") -- lazy.nvim
require("kitty-scrollback").setup({
	{
		paste_window = {
			yank_register_enabled = false,
		},
		visual_selection_highlight_mode = "reverse",
	},
})
