-- Basics
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 250 -- increase update time

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.colorcolumn = "100"

-- Highlight when yanking (copying) text
  --  Try it with `yap` in normal mode
  --  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
    	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    	callback = function() vim.hl.on_yank() end,
})

-- for lsp
vim.opt.signcolumn = 'yes'

require("config.remap")

-- from: https://lazy.folke.io/installation
-- Bootstrap lazy.nvim
require("config.lazy")
