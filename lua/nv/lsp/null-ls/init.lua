local M = {}
local Log = require("core.log")

M.setup = function()
	local status_ok, null_ls = pcall(require, "null-ls")
	if not status_ok then
		Log:error("Missing null-ls dependency")
		return
	end

	Log:info("Setting up null-ls")

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
end

return M
