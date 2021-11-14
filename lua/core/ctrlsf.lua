local M = {}

M.config = function()
	vim.g.ctrlsf_winsize = '35%'
	vim.g.ctrlsf_search_mode = 'async'

	vim.g.ctrlsf_auto_close = {
		normal = 0,
		compact = 0
	}

	vim.g.ctrlsf_auto_focus = {
		at = "done",
		duration_less_than = 1000
	}

end

return M
