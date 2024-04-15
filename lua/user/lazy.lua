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

	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "tamago324/nlsp-settings.nvim" },
	{ "tami5/lspsaga.nvim" }, -- Used for rename

	-- Install nvim-cmp, and buffer source as a dependency
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("nv.core.vsnip").setup()
			require("nv.core.cmp").setup()
		end,
		dependencies = {
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
	},

	-- Icons
	-- { "kyazdani42/nvim-web-devicons" },

	-- Intuitive buffer close
	{ "moll/vim-bbye" },

	-- For telescope etc
	{ "nvim-lua/popup.nvim" },

	-- Nerd Commenter
	{
		"preservim/nerdcommenter",
		config = function()
			require("nv.core.nerdcommenter").config()
		end,
	},

	{
		"MattesGroeger/vim-bookmarks",
		config = function()
			require("nv.core.bookmarks").config()
		end,
	},

	{
		-- Treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nv.core.treesitter").setup()
		end,
	},

	-- TODO: Move and make config-pattern for these

	{ "tom-anders/telescope-vim-bookmarks.nvim" },

	-- See what keys do
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			require("nv.core.whichkey").config()
		end,
	},
}

require("lazy").setup(plugins, {})
