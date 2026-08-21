return {
	"uga-rosa/cmp-dictionary",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		require("cmp_dictionary").setup({
			paths = { vim.fn.expand("/usr/share/dict/words") },
			exact_length = 2,
			first_case_insensitive = true,
			async = true,
		})
	end,
}
