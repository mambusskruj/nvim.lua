return {
    {
        "itchyny/lightline.vim",
        config = function ()
            vim.g.lightline = {
                -- colorscheme = 'tokyonight',
                colorscheme = 'yui',
                -- integration with git, shows git branch at the line
                active = {
                    left = {
                        { 'mode', 'paste' },
                        -- { 'gitbranch', 'relativepath', 'modified' }  -- no need because of nvim winbar
                        { 'gitbranch' }
                    }
                },
                component_function = {
                    gitbranch = 'FugitiveHead'
                }
            }
        end
    },
}
