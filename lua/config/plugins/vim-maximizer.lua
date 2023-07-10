return {
    { 
        "szw/vim-maximizer",
        keys = {
            { "<leader>m", "<cmd>MaximizerToggle!<CR>", noremap = true, silent = true },
        },
        config = function ()
            vim.g.maximizer_set_default_mapping = 0
            vim.g.cursorword_delay = 250
        end
    }
}
