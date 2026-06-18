local function configureTreesitter()
	local configs = require("nvim-treesitter.configs")

	local treesitter_config = {
		ensure_installed = {
			"c",
			"dockerfile",
			"go",
			"html",
			"lua",
			"markdown",
			"typescript",
			"javascript",
			"json",
			"tsx",
			"terraform",
			"yaml",
			"vim",
		}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = {
			enable = true, -- false will disable the whole extension
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = { "yaml" },
		},
	}

	configs.setup(treesitter_config)
end

return {
	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = configureTreesitter,
}
