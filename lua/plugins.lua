-- https://github.com/wbthomason/packer.nvim

-- run => post install
-- setup => pre load
-- config : function  => post load
-- disable : boolean > disable plugin

return {
	-- Packer can manage itself as an optional plugin
	{ "wbthomason/packer.nvim" },

	-- For logger + gitsigns + telescope
	{ "nvim-lua/plenary.nvim" },

	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "tamago324/nlsp-settings.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "tami5/lspsaga.nvim" }, -- Not sure if we want it?
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

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

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
		requires = {
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
		requires = {
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
		run = function()
			-- cmp's config requires cmp to be installed to run the first time
			if not lvim.builtin.cmp then
				require("nv.core.cmp").config()
			end
		end,
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
		run = ":TSUpdate",
		config = function()
			require("nv.core.treesitter").setup()
		end,
	},

	-- Rainbow brackets (Requires treesitter)
	{ "p00f/nvim-ts-rainbow" },

	{
		-- NvimTree
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nv.core.nvimtree").setup()
		end,
	},

	-- Dashboard
	{
		"glepnir/dashboard-nvim",
		event = "BufWinEnter",
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
		requires = {
			"SmiteshP/nvim-gps",
		},
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

	-- " Navigation
	{ "unblevable/quick-scope" },

	-- " Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("nv.core.toggleterm").config()
		end,
	},
}
