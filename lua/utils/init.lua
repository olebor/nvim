local utils = {}
local uv = vim.loop
--- Checks whether a given path exists and is a file.
-- @param path (string) path to check
-- @returns (bool)
function utils.is_file(path)
	local stat = uv.fs_stat(path)
	return stat and stat.type == "file" or false
end

--- Checks whether a given path exists and is a directory
-- @param path (string) path to check
-- @returns (bool)
function utils.is_directory(path)
	local stat = uv.fs_stat(path)
	return stat and stat.type == "directory" or false
end

return utils
