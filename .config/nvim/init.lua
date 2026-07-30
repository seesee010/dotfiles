-- nvim: init.lua

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basics
local opt = vim.opt
opt.expandtab = false
opt.tabstop = 8
opt.shiftwidth = 8
opt.softtabstop = 8
opt.relativenumber = true

-- Lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("theme_switcher")
require("core_boilerplate")
