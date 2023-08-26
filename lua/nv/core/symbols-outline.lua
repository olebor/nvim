local M = {}
local Log = require("core.log")

-- https://github.com/simrat39/symbols-outline.nvim
M.config = function()
	local status_ok, module = pcall(require, "symbols-outline")
	if not status_ok then
		return
	end

	module.setup({
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
end

return M
