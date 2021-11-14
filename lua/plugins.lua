return {
	-- LuaFormatter off
	-- Packer can manage itself as an optional plugin
	{"wbthomason/packer.nvim"},
	{ "neovim/nvim-lspconfig" },

	-- Theme and visuals
	{ 'tomasr/molokai' },
	{ 'crusoexia/vim-monokai' },
	{ 'patstockwell/vim-monokai-tasty' },
	{ 'phanviet/vim-monokai-pro' },
	{ 'dracula/vim' },
	{ 'morhetz/gruvbox' },
	{ 'norcalli/nvim-colorizer.lua' },

	-- Rainbow brackets
	{ 'p00f/nvim-ts-rainbow' },

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

	-- Vim Surround
	{ "tpope/vim-surround" },

	-- Smooth scroll
	{ "psliwka/vim-smoothie" },

	-- Intuitive buffer close
	{ "moll/vim-bbye" },

	-- For telescope etc
	{ "nvim-lua/popup.nvim" },

	-- For logger + gitsigns + telescope
	{ "nvim-lua/plenary.nvim" },

	-- Navigation
	{
		'phaazon/hop.nvim',
		config = function()
			require('core.hop').config()
			require('hop').setup()
		end
	},

	-- File Search
	{
		'dyng/ctrlsf.vim',
		config = function()
			require('core.ctrlsf').config()
		end
	},

	-- Git Blamer (like GitLens)
	{
		"APZelos/blamer.nvim",
		config = function()
			require('blamer')
		end
	},

	{
		'MattesGroeger/vim-bookmarks',
		config = function ()
			require('bookmark')
		end
	},

	-- Install nvim-cmp, and buffer source as a dependency
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("core.vsnip").setup()
			require("core.cmp").setup()
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
			require("core.cmp").config()
		  end
		end,
	},

	-- LuaFormatter on
		--
		{
			-- Autopairs
			"windwp/nvim-autopairs",
			config = function()
				require("core.autopairs").setup()
			end
		}, -- {
		-- Treesitter
		-- "nvim-treesitter/nvim-treesitter",
		-- branch = "0.5-compat",
		-- run = ":TSUpdate",
		-- config = function()
		-- require("core.treesitter").setup()
		-- end
		-- },
		{
			-- NvimTree
			"kyazdani42/nvim-tree.lua",
			-- event = "BufWinOpen",
			-- cmd = "NvimTreeToggle",
			-- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
			config = function()
				require("core.nvimtree").setup()
			end
		}, -- Dashboard
		{
			'glepnir/dashboard-nvim',
			event = "BufWinEnter",
			config = function()
				require("core.dashboard").setup()
			end
		}
}
