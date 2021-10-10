local M = {}

---Get the full path to `$LUNARVIM_RUNTIME_DIR`
---@return string
function _G.get_runtime_dir()
	local lvim_runtime_dir = os.getenv "LUNARVIM_RUNTIME_DIR"
	if not lvim_runtime_dir then
		-- when nvim is used directly
		return vim.fn.stdpath "config"
	end
	return lvim_runtime_dir
end

function M:init()
end

return M
