local Log = require("core.log")

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Include the servers you want to have installed by default below
local servers = {
	"tsserver",
	"terraformls",
	"sumneko_lua",
	"yamlls",
	"html",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			Log:info("Installingg " .. name)
			server:install()
		end
	end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	Log:debug("Server ready: " .. server.name)
	local opts = {
		on_attach = require("nv.lsp.handlers").on_attach,
		capabilities = require("nv.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("nv.lsp.providers.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("nv.lsp.providers.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "tsserver" then
		Log:debug('Nothing to see here')
		-- local tsserver_opts = require("lsp.providers.tsserver")
		-- opts = vim.tbl_deep_extend("force", tsserver_opts , opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
