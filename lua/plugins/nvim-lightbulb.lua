return {
	"kosayoda/nvim-lightbulb",
	event = "VeryLazy",

	config = function()
		require("nvim-lightbulb").setup({
			autocmd = { enabled = true },
			sign = {
				enabled = true,
				priority = 10,
				text = "💡",
			},
			float = {
				enabled = false,
				text = "💡",
				win_opts = {},
			},
			virtual_text = {
				enabled = false,
				text = "💡",
			},
		})
	end,
}
