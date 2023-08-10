return {
    {
        "zbirenbaum/copilot.lua",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = false,
                keymap = {
                    accept = "<leader>j",
                    accept_word = false,
                    accept_line = false,
                    next = "<leader>d",
                    prev = "<leader>s",
                    dismiss = "<leader>a",
                }
            }
        }
    }
}
