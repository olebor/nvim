-- Jump anywhere with labels (modern replacement for hop.nvim).
-- s = jump to location, S = jump by treesitter node.
-- char mode is disabled so f/t/F/T stay exactly as native Vim.
-- https://github.com/folke/flash.nvim

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = { enabled = false },
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
	},
}
