-- https://github.com/folke/lazy.nvim
--
-- build => post install
-- init => pre load
-- config : function  => post load
-- disable : boolean > disable plugin

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Import all files in /lua/plugins
	{ import = "plugins" },

	-- For logger + gitsigns + telescope
	{ "nvim-lua/plenary.nvim" },

	-- Intuitive buffer close
	{ "moll/vim-bbye" },

	-- For telescope etc
	{ "nvim-lua/popup.nvim" },
}

require("lazy").setup(plugins, {})
