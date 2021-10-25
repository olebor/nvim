local M = {}

M.config = function()
	vim.api.nvim_set_keymap('n', 's', ":HopChar1<cr>", {
		silent = true
	})
	vim.api.nvim_set_keymap('n', 'S', ":HopWord<cr>", {
		silent = true
	})
end

return M
