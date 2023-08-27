local M = {}
local Log = require("core.log")

M.config = function()
	local status_telescope, telescope = pcall(require, "telescope")
	if not status_telescope then
		Log:error("Failed to load telescope")
		return
	end

	local actions = require("telescope.actions")
	local sorters = require("telescope.sorters")
	local previewers = require("telescope.previewers")

	telescope.setup({
		defaults = {
			vimgrep_arguments = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
			prompt_prefix = " ",
			selection_caret = " ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			file_sorter = sorters.get_fuzzy_file,
			file_ignore_patterns = {},
			generic_sorter = sorters.get_generic_fuzzy_sorter,
			winblend = 0,
			layout_config = {
				width = 0.75,
				prompt_position = "top",
				preview_cutoff = 120,
				horizontal = { mirror = false },
				vertical = { mirror = false },
			},
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			use_less = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			file_previewer = previewers.vim_buffer_cat.new,
			grep_previewer = previewers.vim_buffer_vimgrep.new,
			qflist_previewer = previewers.vim_buffer_qflist.new,

			-- Developer configurations: Not meant for general override
			buffer_previewer_maker = previewers.buffer_previewer_maker,
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					-- To disable a keymap, put [map] = false
					-- So, to not map "<C-n>", just put
					-- ["<c-x>"] = false,
					["<esc>"] = actions.close,

					-- Otherwise, just set the mapping to the function that you want it to be.
					-- ["<C-i>"] = actions.select_horizontal,

					-- Add up multiple actions
					["<CR>"] = actions.select_default + actions.center,

					-- You can perform as many actions in a row as you like
					-- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
				},
				n = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					-- ["<C-i>"] = my_cool_custom_action,
				},
			},
		},
	})
end

return M
