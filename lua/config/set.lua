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

-- enable by default in neovim -- Better colors
-- vim.opt.termguicolors = true

-- indent with spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- numbers with relatives
vim.opt.nu = true
vim.opt.relativenumber = true

-- columns used for the line number
vim.opt.numberwidth = 1

-- highlight only first finded
-- set nohlsearch

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

-- no vim bottomline because of lightline plugin
vim.opt.showmode = false

-- for git plugin for better displaying
vim.opt.signcolumn = "yes"

-- Install fzf
-- vim.opt.rtp = vim.opt.rtp + "/usr/local/opt/fzf"  -- macos
vim.opt.rtp = vim.opt.rtp + "/usr/bin/fzf"

-- enable linematch diff option
vim.opt.diffopt = vim.opt.diffopt + "linematch:60"

-- tags + lsp (idk what it is)
-- set tagfunc=v:lua.require'vim.lsp.tagfunc'.tagfunc

-- netrw: open files in vertical split
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 30
vim.g.netrw_liststyle = 0
vim.g.netrw_fastbrowse = 0 -- no netrw buffers in the buffers list

-- for shellckeck not to show info messages
vim.env.SHELLCHECK_OPTS = "--severity=warning"

-- better autocompletion experience
vim.opt.completeopt = "menuone,noselect"

-- -- don't change cursor shape on insert mode aka based
-- vim.opt.guicursor = ""

-- disable number row
vim.opt.number = false
vim.opt.relativenumber = false

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

-- vim.opt.winborder = "rounded"
