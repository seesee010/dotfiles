-- Mason setup
--
-- lua: lua_ls
-- zig: zls
-- python: basedpyright
-- c, c++: clangd
-- js, ts: ts_ls
-- json: jsonls
-- yaml: yamlls
-- bash: bashls
-- md: marksman
--
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
		"lua_ls",
		"zls",
		"basedpyright",
		"clangd",
		"ts_ls",
		"jsonls",
		"yamlls",
		"bashls",
		"marksman"
	},
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
