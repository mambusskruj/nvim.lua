local M = {}
local fn = vim.fn

M.abbrevs = {}

local function cabbrev(input, replace)
  M.abbrevs[input] = replace

  local cmd = "cnoreabbrev <expr> %s v:lua.require'config.abbrev'.command('%s')"
  vim.cmd(cmd:format(input, input))
end

function M.command(input)
  if fn.getcmdtype() ~= ":" then
    return input
  end

  if fn.getcmdline() ~= input then
    return input
  end

  return M.abbrevs[input] or input
end

cabbrev("fd", "tabnew | vert GrugFar")
cabbrev("O", "Oil --float")
cabbrev("Oh", "Oil --float ./")
cabbrev("crew", "DiffviewClose")

return M
