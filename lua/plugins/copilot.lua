-- Copilot

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		enabled = true,
		event = { "BufEnter" },
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
