-- I use nvim with --nvim-args --clean --noplugin so configuration changes from there wil not not applied
-- so leave it with defaults
return {
	"mikesmithgh/kitty-scrollback.nvim",
	enabled = true,
	lazy = true,
	cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	event = { "User KittyScrollbackLaunch" },
	-- version = '*', -- latest stable version, may have breaking changes if major version changed
	-- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
	config = function()
		require("kitty-scrollback").setup()
	end,
}
