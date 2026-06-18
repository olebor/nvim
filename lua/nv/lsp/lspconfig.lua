local Log = require("core.log")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	Log:error("LSP Config failed")
	return
end

local handlers = require("nv.lsp.handlers")

handlers.setup()

-- Defaults shared by every server. capabilities advertises nvim-cmp's
-- completion features to the server (previously computed but never passed).
local default_opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
}

-- ****************************************************************************
--
-- Servers that only need the defaults
-- (vtsls = fast TypeScript server, eslint = JS/TS linting, terraform)
--
-- ****************************************************************************
local servers = { "vtsls", "eslint", "terraformls" }
for _, server in ipairs(servers) do
	lspconfig[server].setup(default_opts)
end

-- ****************************************************************************
--
-- Servers needing extra settings
--
-- ****************************************************************************
lspconfig.lua_ls.setup(vim.tbl_extend("force", default_opts, {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}))

lspconfig.yamlls.setup(vim.tbl_extend("force", default_opts, {
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
}))
