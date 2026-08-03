-- Configures lua_ls for editing *this* config: completion and type checking for
-- the Neovim API, and for any plugin module you require(). Only loads for Lua.
-- https://github.com/folke/lazydev.nvim

return {
	"folke/lazydev.nvim",
	ft = "lua",
	cmd = "LazyDev",
	opts = {
		library = {
			-- vim.uv is a separate stub from the main runtime; pulled in only
			-- when a file actually mentions it.
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			-- Types for lazy.nvim plugin specs, i.e. every file in lua/plugins.
			{ path = "lazy.nvim", words = { "LazySpec" } },
		},
	},
}
