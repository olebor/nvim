local M = {}

M.setup = function()
	vim.o.termguicolors = true
	local status_ok, colorizer = pcall(require, "colorizer")
	if not status_ok then
		return
	end


	colorizer.setup()
end

return M
