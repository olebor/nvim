local function configureWhichkey()
	local which_key = require("which-key")

	which_key.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		win = {
			no_overlap = true,
			border = "single",
			padding = { 1, 2 },
			title = true,
			title_pos = "center",
			zindex = 1000,
			bo = {},
			wo = {},
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "center",
		},
		show_help = false,
	})

	which_key.add({
		-- Bookmark mappings (m prefix)
		{ "ma", "<cmd>BookmarkAnnotate<cr>", desc = "Annotate" },
		{ "mc", "<cmd>BookmarkClear<cr>", desc = "Clear" },
		{ "mm", "<cmd>BookmarkToggle<cr>", desc = "Toggle" },
		{ "mj", "<cmd>BookmarkNext<cr>", desc = "Next" },
		{ "mk", "<cmd>BookmarkPrev<cr>", desc = "Prev" },
		{
			"ms",
			"<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
			desc = "Show",
		},
		{ "mx", "<cmd>BookmarkClearAll<cr>", desc = "Clear All" },

		-- Leader single-key mappings
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
		{ "<leader>w", "<cmd>:Bwipeout<CR>", desc = "Wipe Buffer" },
		{ "<leader>n", "<cmd>nohlsearch<CR>", desc = "No HL" },
		{ "<leader>7", "<plug>NERDCommenterInvert", desc = "Comment" },
		{ "<leader>h", "<C-W>s", desc = "Split Below" },
		{ "<leader>v", "<C-W>v", desc = "Split Right" },
		{ "<leader>=", "<C-W>=", desc = "Balance Buffers" },
		{ "<leader>p", ":Telescope find_files<cr>", desc = "Find Files" },

		-- Buffer group
		{ "<leader>b", group = "Buffer" },
		{
			"<leader>bb",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false,layout_config={width=0.6}})<cr>",
			desc = "Find Buffers",
		},
		{ "<leader>bc", "<cmd>:set cc=80<cr>", desc = "Highlight col 80" },
		{ "<leader>bw", "<cmd>:set wrap linebreak nolist<cr>", desc = "Soft Wrap" },
		{ "<leader>bn", "<cmd>:set nowrap<cr>", desc = "No Wrap" },
		{ "<leader>bt", "<cmd>:set textwidth=72<cr>", desc = "Hard wrap 72" },

		-- Find group
		{ "<leader>f", group = "Find" },
		{ "<leader>ff", ":Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fg", ":Telescope git_files<cr>", desc = "Git Files" },
		{ "<leader>ft", ":Telescope live_grep<cr>", desc = "Live Grep" },

		-- Git group
		{ "<leader>g", group = "Git" },
		{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
		{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
		{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
		{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
		{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
		{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },

		-- LSP group
		{ "<leader>l", group = "LSP" },
		{ "<leader>lL", '<cmd>lua vim.diagnostic.open_float({ scope="line" })<cr>', desc = "Line Diagnostics" },
		{ "<leader>lf", "<cmd>lua vim.lsp.buf.format({timeout_ms = 5000, async = true})<cr>", desc = "Format" },
		{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
		{ "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "Outline" },
		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },

		-- Surround group
		{ "<leader>s", group = "Surround" },
		{ "<leader>s.", "<cmd>lua require('surround').repeat_last()<cr>", desc = "Repeat" },
		{ "<leader>sa", "<cmd>lua require('surround').surround_add(true)<cr>", desc = "Add" },
		{ "<leader>sd", "<cmd>lua require('surround').surround_delete()<cr>", desc = "Delete" },
		{ "<leader>sr", "<cmd>lua require('surround').surround_replace()<cr>", desc = "Replace" },
		{ "<leader>sq", "<cmd>lua require('surround').toggle_quotes()<cr>", desc = "Quotes" },
		{ "<leader>sb", "<cmd>lua require('surround').toggle_brackets()<cr>", desc = "Brackets" },

		-- Terminal group
		{ "<leader>t", group = "Terminal" },
		{ "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal" },

		-- Visual mode mappings
		{ "<leader>7", "<plug>NERDCommenterInvert", desc = "Comment", mode = "v" },
	})
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = configureWhichkey,
}
