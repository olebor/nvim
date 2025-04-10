-- https://github.com/lewis6991/gitsigns.nvim

local function configureGitsigns()
	local opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
		},
		numhl = false,
		linehl = false,
		-- keymaps = {
		-- Default keymap options
		-- noremap = true,
		-- buffer = true
		-- },
		watch_gitdir = {
			interval = 1000,
		},
		sign_priority = 6,
		update_debounce = 200,
		status_formatter = nil, -- Use default
		current_line_blame = true,
	}

	local gitsigns = require("gitsigns")
	gitsigns.setup(opts)
end

-- Config for Lazy
return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = configureGitsigns,
	},
	{ "tpope/vim-fugitive" },
	{ "junegunn/gv.vim" },
}
