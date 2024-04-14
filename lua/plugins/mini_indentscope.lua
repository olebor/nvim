-- https://github.com/echasnovski/mini.indentscope
-- Mini indentscope
--
-- Description:
-- Will draw vertical lines to indicate the scope of the code block you are in

return {
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "BufEnter",
		opts = {
			draw = {
				delay = 0,
			},
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				desc = "Disable indentscope for certain filetypes",
				pattern = {
					"help",
					"lazy",
					"mason",
					"notify",
					"nvimtree",
					"dashboard",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
