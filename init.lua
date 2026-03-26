vim.g.mapleader = " "
vim.opt.tabstop = 2 -- Number of spaces a tab represents
vim.opt.shiftwidth = 2 -- Number of spaces for each indentation level
vim.opt.softtabstop = 2 -- Number of spaces for soft tabs
vim.opt.expandtab = true -- Convert tabs to spaces
vim.wo.number = true
vim.wo.relativenumber = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins")

require("remap")
