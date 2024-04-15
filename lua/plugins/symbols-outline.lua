return {
	-- https://github.com/simrat39/symbols-outline.nvim
	"simrat39/symbols-outline.nvim",
	config = function()
		local symbolsOutline = require("symbols-outline")

		symbolsOutline.setup({
			highlight_hovered_item = true,
			show_guides = true,
			auto_preview = true,
			position = "right",
			keymaps = {
				close = "<Esc>",
				goto_location = "<Cr>",
				focus_location = "o",
				hover_symbol = "<C-space>",
				rename_symbol = "r",
				code_actions = "a",
			},
			lsp_blacklist = {},
		})
	end,
}
