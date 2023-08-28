local M = {}
local Log = require("core.log")

M.config = function()
	local status_ok, copilot = pcall(require, "copilot")
	if not status_ok then
		Log:error("Failed to load copilot")
		return
	end

	copilot.setup({
		-- your options here
		suggestion = { enabled = false },
		panel = { enabled = false },
	})
end

return M
