local function configureTreesitter()
	local configs = require("nvim-treesitter.configs")

	local treesitter_config = {
		on_config_done = nil,
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
		ignore_install = {},
		matchup = {
			enable = false, -- mandatory, false will disable the whole extension
			-- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			additional_vim_regex_highlighting = true,
			disable = {},
		},
		context_commentstring = {
			enable = true,
			config = {
				-- Languages that have a single comment style
				typescript = "// %s",
				css = "/* %s */",
				scss = "/* %s */",
				html = "<!-- %s -->",
				svelte = "<!-- %s -->",
				vue = "<!-- %s -->",
				json = "",
			},
		},
		-- indent = {enable = true, disable = {"python", "html", "javascript"}},
		-- TODO seems to be broken
		indent = {
			enable = true,
			disable = { "yaml" },
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
			max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
		},
		autotag = {
			enable = false,
		},
		textobjects = {
			swap = {
				enable = false,
				-- swap_next = textobj_swap_keymaps,
			},
			-- move = textobj_move_keymaps,
			select = {
				enable = false,
				-- keymaps = textobj_sel_keymaps,
			},
		},
		textsubjects = {
			enable = false,
			keymaps = {
				["."] = "textsubjects-smart",
				[";"] = "textsubjects-big",
			},
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
