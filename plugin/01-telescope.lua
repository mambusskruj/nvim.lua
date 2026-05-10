vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("telescope-fzf-native.nvim")
      end
      vim
        .system({ "make" }, {
          cwd = ev.data.path,
        })
        :wait()
    end
  end,
})
vim.pack.add({ "https://github.com/nvim-telescope/telescope-fzf-native.nvim" })

vim.pack.add({ "https://github.com/nvim-telescope/telescope-live-grep-args.nvim" })

vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })

local telescope = require("telescope")
telescope.setup({
  defaults = {
    initial_mode = "insert", -- can be 'insert' and 'normal'
    wrap_results = true,
    winblend = 0,
    border = true,
    layout_strategy = "vertical",
    layout_config = {
      width = 0.9,
      -- preview_width = 0.45, -- only for horizontal layout
      scroll_speed = 5,
    },
    scroll_speed = 5,
    scroll_strategy = "limit",
    preview = { filesize_limit = 1 },

    -- for find_files
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "column",
      "--smart-case",
      "--hidden",
    },

    -- for live_grep and string_grep
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },

    file_ignore_patterns = { ".git/", "node_modules/", ".env/", "env/", ".cache/" },
    path_display = { "truncate" },
    -- path_display = { "filename_first" },

    mappings = {
      n = { -- normal mode (i for insert mode)
        ["<C-c>"] = function(...)
          require("telescope.actions").close(...)
        end,
        ["<Space>c"] = function(...)
          require("telescope.actions").send_selected_to_qflist(...)
          require("telescope.actions").open_qflist(...)
        end,
      },
      i = {
        ["<S-Down>"] = function(...)
          require("telescope.actions").cycle_history_next(...)
        end,
        ["<S-Up>"] = function(...)
          require("telescope.actions").cycle_history_prev(...)
        end,
      },
    },
  },

  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      initial_mode = "insert", -- can be 'insert' and 'normal'
    },

    grep_string = {
      only_sort_text = true,
      max_results = 30,
      hidden = true,
    },

    live_grep = {
      only_sort_text = true,
      max_results = 30,
      hidden = true,
    },

    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      initial_mode = "insert", -- can be 'insert' and 'normal'
    },
    lsp_document_symbols = {
      ignore_symbols = { "variable", "constant" },
    },
  },
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "live_grep_args")

vim.keymap.set("n", "<leader>o", function()
  require("telescope.builtin").find_files()
end)

vim.keymap.set("n", "<leader>[", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end)

vim.keymap.set("n", "<leader>;", function()
  require("telescope.builtin").grep_string({
    search = vim.fn.input("Grep > "),
  })
end)

vim.keymap.set("v", "<leader>;", function()
  require("telescope.builtin").grep_string()
end)

vim.keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").buffers()
end)

vim.keymap.set("n", "<leader>l", function()
  require("telescope.builtin").lsp_document_symbols()
end)

vim.keymap.set("n", "<leader>s", function()
  require("telescope.builtin").search_history()
end)

vim.keymap.set("n", "<leader>c", function()
  require("telescope.builtin").command_history()
end)
