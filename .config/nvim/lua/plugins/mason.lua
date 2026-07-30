local mason_spec = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",       -- C/C++
        "lua_ls",       -- Lua
        "pyright",      -- Python
        "zls",          -- Zig
        "ts_ls",        -- JS/TS
        "bashls",       -- Bash
      },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("*", { capabilities = capabilities })

    local servers = mason_lspconfig.get_installed_servers()
    vim.lsp.enable(servers)
  end,
}

return mason_spec
