local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local handlers = require("nv.lsp.handlers")

handlers.setup()

lspconfig.lua_ls.setup {
	on_attach = handlers.on_attach
}

lspconfig.tsserver.setup {
	on_attach = handlers.on_attach
}

lspconfig.terraformls.setup {
	on_attach = handlers.on_attach
}

lspconfig.yamlls.setup {
	on_attach = handlers.on_attach
}
