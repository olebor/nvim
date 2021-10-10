return {
	-- LuaFormatter off
	-- Packer can manage itself as an optional plugin
	{"wbthomason/packer.nvim"},
	{ "neovim/nvim-lspconfig" },

	-- For telescope etc
	{ "nvim-lua/popup.nvim" },

	-- For logger + gitsigns + telescope
	{"nvim-lua/plenary.nvim"},

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

	-- LuaFormatter on
	-- NvimTree
	{
		"kyazdani42/nvim-tree.lua",
		-- event = "BufWinOpen",
		-- cmd = "NvimTreeToggle",
		-- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
		config = function()
			require("core.nvimtree").setup()
		end
	}, {
		-- Dashboard
		'glepnir/dashboard-nvim',
		event = "BufWinEnter",
		config = function()
			require("core.dashboard").setup()
		end
	}
}
