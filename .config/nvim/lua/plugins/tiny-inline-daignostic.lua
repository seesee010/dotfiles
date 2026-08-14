return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
		preset = "simple",
		transparent_bg = false,
		set_arrow_to_diag_color = true,

		options = {
			severity = {
				vim.diagnostic.severity.ERROR
			}
		}
	})
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
}
