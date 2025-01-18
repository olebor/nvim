-- Hop to anywhere
-- Forked: smoka7/hop.nvim

return {
	"smoka7/hop.nvim",
	config = function()
		vim.api.nvim_set_keymap("n", "s", ":HopChar1<cr>", {
			silent = true,
		})
		vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", {
			silent = true,
		})

		require("hop").setup(
			{ keys = 'etovxqpdygfblzhckisuran' }
		)
	end,
}
