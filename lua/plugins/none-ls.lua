-- none-ls is a fork of null-ls.nvim that is more actively maintained.
-- https://github.com/nvimtools/none-ls.nvim

return {

	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		local formatting = null_ls.builtins.formatting

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			debug = false,
			diagnostics_format = "[#{c}] #{m} (#{s})",
			sources = {
				-- Formatting js/ts with prettier + eslint
				-- This works now (eslint lsp running after) but not sure why
				formatting.prettier,
				-- formatting.eslint_d,

				-- Lua
				formatting.stylua,
			},
		})
	end,
}
