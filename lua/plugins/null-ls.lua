return {

	"jose-elias-alvarez/null-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		local formatting = null_ls.builtins.formatting

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			debug = true,
			diagnostics_format = "[#{c}] #{m} (#{s})",
			sources = {
				-- Enable ESLint for diagnostics
				diagnostics.eslint_d,

				-- diagnostics.eslint_d,
				-- Formatting js/ts with prettier + eslint
				formatting.prettier,
				formatting.eslint_d,

				formatting.stylua,
				-- formatting.terraform,
			},
		})
	end,
}
