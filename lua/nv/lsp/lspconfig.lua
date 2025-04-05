local Log = require("core.log")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	Log:error("LSP Config failed")
	return
end

local handlers = require("nv.lsp.handlers")

handlers.setup()

-- ****************************************************************************
--
-- JS Dev - tesserver + eslint
--
-- ****************************************************************************
lspconfig.ts_ls.setup({
	on_attach = handlers.on_attach,
})

lspconfig.eslint.setup({
	on_attach = handlers.on_attach,
})

-- ****************************************************************************
--
-- Other
--
-- ****************************************************************************
lspconfig.lua_ls.setup({
	on_attach = handlers.on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.terraformls.setup({
	on_attach = handlers.on_attach,
})

lspconfig.yamlls.setup({
	on_attach = handlers.on_attach,
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})
