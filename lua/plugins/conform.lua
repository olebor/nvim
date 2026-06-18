-- Formatting via conform.nvim (replaces none-ls).
-- Picks up project-local node_modules/.bin/prettier automatically.
-- https://github.com/stevearc/conform.nvim

local function configureConform()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			markdown = { "prettier" },
		},
		-- Format on save, falling back to the LSP for filetypes without a
		-- configured formatter (e.g. terraform via terraformls).
		format_on_save = function()
			return { timeout_ms = 2000, lsp_format = "fallback" }
		end,
	})
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = configureConform,
}
