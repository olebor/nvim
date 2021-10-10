return {
	-- LuaFormatter off
	-- Packer can manage itself as an optional plugin
	{"wbthomason/packer.nvim"},

	{"nvim-lua/plenary.nvim"},

	-- LuaFormatter on
	-- NvimTree
	{
		"kyazdani42/nvim-tree.lua",
		-- event = "BufWinOpen",
		-- cmd = "NvimTreeToggle",
		-- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
		config = function()
			require("core.nvimtree").setup()
		end,
		disable = false
	}

}
