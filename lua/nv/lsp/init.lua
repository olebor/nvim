local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nv.lsp.lsp-installer")
require("nv.lsp.handlers").setup()
require("nv.lsp.null-ls").setup()
