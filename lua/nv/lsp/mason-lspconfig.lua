local status_ok, module = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

module.setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"terraformls",
		"yamlls",
		"eslint",
	},
})
