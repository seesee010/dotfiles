-- lua/plugins/cmp.lua
-- 
-- [NOTE]: this file is fully created by claude (Sonnet 5 : Low), 
-- I can't guarantee that this is all ok. Please check for yourself.
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "VeryLazy" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "lazydev", group_index = 0 },
        { name = "nvim_lsp" },
        { name = "luasnip" },
	{ name = "dictionary", keyword_length = 2 },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
