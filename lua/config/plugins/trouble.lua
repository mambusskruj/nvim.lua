return {
    {
  "folke/trouble.nvim",
  branch = "main",
  keys = {
    {
      "<leader>gt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>gT",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
}
    -- {
    --     "folke/trouble.nvim",
    --     config = function()
    --         require("trouble").setup({
    --             icons = false,
    --         })
    --
    --         vim.keymap.set("n", "<leader>gt", function()
    --             require("trouble").toggle()
    --         end)
    --
    --         vim.keymap.set("n", "t]", function()
    --             require("trouble").next({skip_groups = true, jump = true});
    --         end)
    --
    --         vim.keymap.set("n", "t[", function()
    --             require("trouble").previous({skip_groups = true, jump = true});
    --         end)
    --
    --     end
    -- },
}
