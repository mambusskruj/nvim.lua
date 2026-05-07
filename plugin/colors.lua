vim.pack.add({ "https://github.com/yorickpeterse/nvim-grey" })
vim.cmd.colorscheme("grey")
vim.cmd([[set background=light]])

-- highlight arguments
vim.pack.add({ "https://github.com/m-demare/hlargs.nvim" })
require("hlargs").setup({
	color = "#c4331d",
})
