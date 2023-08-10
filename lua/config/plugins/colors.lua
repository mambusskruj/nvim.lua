-- vim.api.nvim_set_hl(0, "DapUIDecoration", { guifg = "#b4aba7" })
-- vim.api.nvim_set_hl(0, "DapUIModifiedValue", { guifg = "#268bd2" })
-- vim.api.nvim_set_hl(0, "DapUIScope", { guifg = "#7f726c", gui = "bold" })
-- vim.api.nvim_set_hl(0, "DapUIType", { guifg = "#268bd2" })
-- vim.api.nvim_set_hl(0, "DapUIThread", { guifg = "#268bd2" })
-- vim.api.nvim_set_hl(0, "DapUIStoppedThread", { guifg = "#7f726c" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { guifg = "#7f726c" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { guifg = "#7f726c" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { guifg = "#7f726c" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsDisabledLine", { guifg = "#292523" })
-- vim.api.nvim_set_hl(0, "DapUISource", { guifg = "#292523" })
-- vim.api.nvim_set_hl(0, "DapUILineNumber", { guifg = "#7f726c" })

return {
    {
        "cideM/yui",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[let g:yui_lightline = v:true]])
            -- vim.cmd([[let g:yui_comments = 'bg']])
            -- vim.cmd([[let g:yui_line_numbers = 'fade']])
            -- vim.cmd([[colorscheme yui]])
        end,
    },
    {
        "mambusskruj/happy_hacking.vim",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[set background=dark]])
            vim.cmd([[colorscheme happy_hacking]])
        end,
    },


}

-- return {
--     {
--         "folke/tokyonight.nvim",
--         lazy = false,
--         priority = 1000,
--         opts = { style = "day" },
--         config = function()
--             -- load the colorscheme here
--             vim.cmd([[colorscheme tokyonight-day]])
--         end,
--     }
-- }


