-- load different themes.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sh", "zsh", "bash" },
	callback = function()
		pcall(vim.cmd.colorscheme, "kanagawa")
	end,
})

-- Idk, this will be used as plugin.
return {}
