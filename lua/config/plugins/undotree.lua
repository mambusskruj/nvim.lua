-- undotree
-- Every change has a sequence number and it is displayed before timestamps.
-- The current state is marked as > number <.
-- The next state which will be restored by :redo or <ctrl-r> is marked as { number }.
-- The [ number ] marks the most recent change.
-- The undo history is sorted by timestamps.
-- Saved changes are marked as s and the big S indicates the most recent saved change.
return {
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", noremap = true },
        },

    }
}
