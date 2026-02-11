-- Hop to anywhere
-- Forked: smoka7/hop.nvim

return {
	"smoka7/hop.nvim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "s", ":HopChar1<cr>", { silent = true })
		vim.keymap.set("n", "S", ":HopWord<cr>", { silent = true })

		require("hop").setup(
			{ keys = 'etovxqpdygfblzhckisuran' }
		)
	end,
}
