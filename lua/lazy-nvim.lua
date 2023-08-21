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
	-- For logger + gitsigns + telescope
	{ "nvim-lua/plenary.nvim" },

	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "tamago324/nlsp-settings.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "tami5/lspsaga.nvim" }, -- Not sure if we want it?

	-- Copilot
	{
		"github/copilot.vim",
		init = function()
			require("nv.core.copilot").setup()
		end,
	},
	-- { "RRethy/vim-illuminate" },

	-- Theme and visuals
	{ "tomasr/molokai" },
	{ "crusoexia/vim-monokai" },
	{ "patstockwell/vim-monokai-tasty" },
	{ "phanviet/vim-monokai-pro" },
	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("nv.colorschemes.dracula").config()
		end,
	},

	-- Bufferline (file/buffer line at the top)
	{
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("nv.core.bufferline").config()
		end,
	},

	-- Colors
	{
		"norcalli/nvim-colorizer.lua",
		build = function()
			require("nv.core.colorizer").setup()
		end,
	},

	-- Icons
	-- { "kyazdani42/nvim-web-devicons" },

	-- Vim Surround
	{ "tpope/vim-surround" },

	-- Smooth scroll
	-- { "psliwka/vim-smoothie" },

	-- Intuitive buffer close
	{ "moll/vim-bbye" },

	-- For telescope etc
	{ "nvim-lua/popup.nvim" },

	-- Git stuff
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("nv.core.gitsigns")
		end,
	},
	{ "tpope/vim-fugitive" },
	{ "junegunn/gv.vim" },

	-- Navigation
	{
		"phaazon/hop.nvim",
		config = function()
			require("nv.core.hop").config()
		end,
	},

	-- File Search
	{
		"dyng/ctrlsf.vim",
		config = function()
			require("nv.core.ctrlsf").config()
		end,
	},

	-- Nerd Commenter
	{
		"preservim/nerdcommenter",
		config = function()
			require("nv.core.nerdcommenter").config()
		end,
	},

	-- Git Blamer (like GitLens)
	{
		"APZelos/blamer.nvim",
		config = function()
			require("nv.core.blamer").config()
		end,
	},

	{
		"MattesGroeger/vim-bookmarks",
		config = function()
			require("nv.core.bookmarks").config()
		end,
	},

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

	{
		-- Autopairs
		"windwp/nvim-autopairs",
		config = function()
			require("nv.core.autopairs").setup()
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

	-- Rainbow brackets (Requires treesitter)
	-- { "p00f/nvim-ts-rainbow" },
	{
		-- NvimTree
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nv.core.nvimtree").setup()
		end,
	},

	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		-- event = "BufWinEnter",
		event = "VimEnter",
		config = function()
			require("nv.core.dashboard").setup()
		end,
	},

	-- TODO: Move and make config-pattern for these

	{ "kosayoda/nvim-lightbulb" },

	{ "simrat39/symbols-outline.nvim" },

	{ "tom-anders/telescope-vim-bookmarks.nvim" },

	-- " Telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },

	-- " File Search
	{ "airblade/vim-rooter" },

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		-- requires = {
		-- "SmiteshP/nvim-gps",
		-- },
		config = function()
			require("nv.core.lualine").config()
		end,
	},

	-- " See what keys do like in emacs
	{
		"folke/which-key.nvim",
		config = function()
			require("nv.core.whichkey").config()
		end,
	},

	-- " Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("nv.core.toggleterm").config()
		end,
	},
}

require("lazy").setup(plugins, {})