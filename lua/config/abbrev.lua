local M = {}
local fn = vim.fn

local function cabbrev(input, replace)
	local cmd = "cnoreabbrev <expr> %s v:lua.require'config.abbrev'.command('%s', '%s')"

	vim.cmd(cmd:format(input, input, replace))
end

function M.command(cmd, match)
	if fn.getcmdtype() == ":" and fn.getcmdline():match("^" .. cmd) then
		return match
	else
		return cmd
	end
end

cabbrev("fd", "GrugFar")
cabbrev("rew", "DiffviewOpen")
cabbrev("crew", "DiffviewClose")
cabbrev("wd", "windo diffthis")
cabbrev("wdc", "windo diffoff")

return M
