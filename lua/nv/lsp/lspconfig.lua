-- Neovim 0.11 native LSP configuration.
--
-- nvim-lspconfig still ships each server's base definition (cmd, filetypes,
-- root markers) as `lsp/<server>.lua` files that Neovim discovers automatically,
-- so we no longer use the deprecated `require('lspconfig').<server>.setup()`
-- framework. mason-lspconfig (automatic_enable = true) enables the installed
-- servers for us; here we only register shared defaults and per-server overrides
-- via vim.lsp.config().

local handlers = require("nv.lsp.handlers")

handlers.setup()

-- Defaults shared by every server. capabilities advertises nvim-cmp's
-- completion features to the server; on_attach wires up buffer-local
-- keymaps and document highlighting.
vim.lsp.config("*", {
	capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
})

-- ****************************************************************************
--
-- Servers needing extra settings (merged on top of the defaults above and
-- nvim-lspconfig's base config).
--
-- ****************************************************************************
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})
