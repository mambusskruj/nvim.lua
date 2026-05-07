-- Too many mistakes
vim.keymap.set("ca", "W", "w")
vim.keymap.set("ca", "Q", "q")
vim.keymap.set("ca", "Qa", "qa")
vim.keymap.set("ca", "QA", "qa")
vim.keymap.set("ca", "Wq", "wq")
vim.keymap.set("ca", "WQ", "wq")
vim.keymap.set("ca", "Wqa", "wqa")
vim.keymap.set("ca", "WQa", "wqa")
vim.keymap.set("ca", "WQA", "wqa")

-- nvim feature for filename on the top
vim.opt.winbar = "%=%m %f%="
-- vim.opt.winbar = "%=%m %=%f"

-- global statusline (always and ONLY the last window)
vim.opt.laststatus = 3
vim.g.qf_disable_statusline = true

-- self explainatory
vim.opt.fillchars = {
	fold = " ",
	diff = "╱",
	wbr = " ",
	msgsep = "─",
}

-- set shell for faster output
vim.opt.shell = "/opt/homebrew/bin/bash" -- macos
-- vim.opt.shell = "/bin/bash" --fedora

-- copy to system clipboard
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

-- add newline at the end of a file
vim.opt.eol = true

-- use dash as part of the word
-- vim.opt.iskeyword = vim.opt.iskeyword + "-"

-- highlight cursor line
-- vim.opt.cursorline = true

-- indent with spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- numbers with relatives
vim.opt.nu = false
vim.opt.relativenumber = false

-- columns used for the line number
vim.opt.numberwidth = 1

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current

-- start scrolling when X lines from top or bottom
vim.opt.scrolloff = 10

-- scroll lines with ctrl+d and ctrl+u
vim.opt.scroll = 15

-- undo history
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 50 -- Save swap file and trigger CursorHold

-- case-insensitive search unless capital letters are used
-- vim.opt.smartcase = true
vim.opt.ignorecase = true

-- show Insert, Replace or Visual mode
vim.opt.showmode = true

-- left column before text block
vim.opt.signcolumn = "yes"

-- Install fzf (can be for fzf-lua)
vim.opt.rtp = vim.opt.rtp + "/opt/homebrew/bin/fzf" -- macos
-- vim.opt.rtp = vim.opt.rtp + "/usr/bin/fzf"

-- enable linematch diff option
-- vim.fugitive respects these options
vim.opt.diffopt = vim.opt.diffopt + "algorithm:histogram,context:10,linematch:60"

-- for shellckeck not to show info messages
vim.env.SHELLCHECK_OPTS = "--severity=warning"

-- better autocompletion experience
vim.opt.completeopt = "menuone,preselect,noinsert,popup"
vim.opt.autocomplete = true
vim.opt.complete = "o^5,.^3,b^3,w^3"
vim.opt.pumheight = 15

-- add spellfile
-- zg - add word to spellfile
-- zw - remove word from spellfile
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- Concealing only for markdown files
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "markdown",
	callback = function()
		-- allow concealed characters (hide markdown)
		vim.opt.conceallevel = 2
	end,
})

vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
