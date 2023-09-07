if vim.g.neovide then
	vim.o.guifont = "Comic Code:h13"

	vim.g.neovide_padding_top = 0 -- Set to 40 if the tabline is hidden
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 350
	vim.g.neovide_padding_left = 350

	vim.g.neovide_refresh_rate_idle = 5

	vim.g.neovide_hide_mouse_when_typing = true

	vim.g.neovide_remember_window_size = true

	vim.g.neovide_fullscreen = true

	vim.g.neovide_input_use_logo = true
	vim.g.neovide_input_macos_alt_is_meta = true
	vim.g.neovide_underline_automatic_scaling = true

    vim.g.neovide_cursor_trail_size = 0.3

	vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
