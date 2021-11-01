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

	-- For telescope etc
	{ "nvim-lua/popup.nvim" },

	-- For logger + gitsigns + telescope
	{"nvim-lua/plenary.nvim"},

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

	-- Vim Surround
	{ "tpope/vim-surround" },
	

	-- Smooth scroll
	{ "psliwka/vim-smoothie" },

	-- Intuitive buffer close
	{ "moll/vim-bbye" },

	-- LuaFormatter on
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