vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "mason" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("mason")
      end
      vim.cmd("MasonUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/cenk1cenk2/schema-companion.nvim",
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("schema-companion").setup()

vim.lsp.enable({
  "lua_ls",
  "ansiblels",
  "ruff",
  "bashls",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  "groovyls",
  "helm_ls",
  "html",
  "jsonls",
  "terraformls",
  "ts_ls",
  "taplo",
  "marksman",
  "harper_ls",
  "basedpyright",
  "yamlls",
})
