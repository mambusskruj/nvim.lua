-- check english grammarous
-- q 	Quit the info window
-- <CR> 	Move to the location of the error
-- f 	Fix the error automatically
-- r 	Remove the error without fix
-- R 	Disable the grammar rule in the checked buffer
-- n 	Move to the next error's location
-- p 	Move to the previous error's location
-- ? 	Show help of the mapping in info window
return {
    {
        "rhysd/vim-grammarous",
        lazy = false,
        keys = {
            { "<leader>g", "<cmd>GrammarousCheck --lang=en --comments-only<cr>", noremap = true },
        },

    }
}
