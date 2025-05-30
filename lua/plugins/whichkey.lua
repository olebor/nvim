local function configureWhichkey()
	local which_key = require("which-key")

	local setup = {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = false, -- adds help for motions
				text_objects = false, -- help for text objects triggered after entering an operator
				windows = false, -- default bindings on <c-w>
				nav = false, -- misc bindings to work with windows
				z = false, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		-- operators = { gc = "Comments" },
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			-- ["<space>"] = "SPC",
			-- ["<cr>"] = "RET",
			-- ["<tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		window = {
			border = "rounded", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 },                                     -- min and max height of the columns
			width = { min = 20, max = 50 },                                     -- min and max width of the columns
			spacing = 3,                                                        -- spacing between columns
			align = "center",                                                   -- align columns left, center or right
		},
		ignore_missing = true,                                                  -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = false,                                                      -- show help message on the command line when the popup is visible
		-- triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specify a list manually
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			-- most people should not need to change this
			i = { "j", "k" },
			v = { "j", "k" },
		},
	}

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local m_opts = {
		mode = "n", -- NORMAL mode
		prefix = "m",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	-- Bookmarks - trigger with m
	local m_mappings = {
		a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
		c = { "<cmd>BookmarkClear<cr>", "Clear" },
		m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
		j = { "<cmd>BookmarkNext<cr>", "Next" },
		k = { "<cmd>BookmarkPrev<cr>", "Prev" },
		s = {
			"<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
			"Show",
		},
		x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
	}

	local mappings = {
		-- Single letter mappings
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["w"] = { "<cmd>:Bwipeout<CR>", "Wipe Buffer" },
		["n"] = { "<cmd>nohlsearch<CR>", "No HL" },
		["7"] = { "<plug>NERDCommenterInvert", "Comment" },
		["h"] = { "<C-W>s", "Split Below" },
		["v"] = { "<C-W>v", "Split Right" },
		["="] = { "<C-W>=", "Balance Buffers" },
		["p"] = { ":Telescope find_files<cr>", "Live grep" },
		-- Multi level mappings
		--
		b = {
			name = "Buffer",
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Find Buffers",
			},
			c = { "<cmd>:set cc=80<cr>", "Highlight col 80" },
			w = { "<cmd>:set wrap linebreak nolist<cr>", "Soft Wrap" },
			n = { "<cmd>:set nowrap<cr>", "No Wrap" },
			t = { "<cmd>:set textwidth=72<cr>", "Hard wrap 72" },
		},
		f = {
			name = "Find",
			f = { ":Telescope find_files<cr>", "Live grep" },
			g = { ":Telescope git_files<cr>", "Live grep" },
			t = { ":Telescope live_grep<cr>", "Live grep" },
		},
		g = {
			name = "Git",
			g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		},
		l = {
			name = "LSP",
			L = { '<cmd>lua vim.diagnostic.open_float({ scope="line" })<cr>', "line_diagnostics" },
			f = { "<cmd>lua vim.lsp.buf.format({timeout_ms = 5000, async = true})<cr>", "Format" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			o = { "<cmd>SymbolsOutline<cr>", "Outline" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			-- s = {
			-- "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols='function'})<cr>",
			-- "Document Symbols",
			-- },
			-- TODO: Review
			-- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			-- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			-- q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			-- R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
		},
		s = {
			name = "Surround",
			["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
			a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
			d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
			r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
			q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
			b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
		},
		t = {
			name = "Terminal",
			g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
			t = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
			h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
			v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		},
	}

	-- Mappings in Visual mode
	local v_mappings = {
		mode = "v",
		{ "<leader>7", "<plug>NERDCommenterInvert", desc = "Comment" },
	}

	-- Apply mappings
	which_key.setup(setup)
	which_key.register(mappings, opts)
	which_key.register(m_mappings, m_opts)
	which_key.add(v_mappings)
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = configureWhichkey,
}
