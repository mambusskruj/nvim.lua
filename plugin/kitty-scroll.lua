-- I use nvim with --nvim-args --clean --noplugin so configuration changes from there wil not not applied
-- so leave it with defaults
vim.pack.add({ "https://github.com/mikesmithgh/kitty-scrollback.nvim" })
require("kitty-scrollback").setup()
