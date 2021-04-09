local M = {}

local function file_readonly(readonly_icon)
	if vim.bo.filetype == 'help' then return '' end
	local icon = readonly_icon or ''
	if vim.bo.readonly == true then return " " .. icon .. " " end
	return ''
end

-- get current file name
function M.get_current_file_path(modified_icon, readonly_icon)
	local file = vim.fn.expand('%:t')
	if vim.fn.empty(file) == 1 then return '' end
	if string.len(file_readonly(readonly_icon)) ~= 0 then return file .. file_readonly(readonly_icon) end
	local icon = modified_icon or ''
	if vim.bo.modifiable then if vim.bo.modified then return file .. ' ' .. icon .. '  ' end end
	return file .. ' '
end

-- format print current file size
function M.format_file_size(file)
	local size = vim.fn.getfsize(file)
	if size == 0 or size == -1 or size == -2 then return "" end
	if size < 1024 then
		size = size .. "b"
	elseif size < 1024 * 1024 then
		size = string.format("%.1f", size / 1024) .. "k"
	elseif size < 1024 * 1024 * 1024 then
		size = string.format("%.1f", size / 1024 / 1024) .. "m"
	else
		size = string.format("%.1f", size / 1024 / 1024 / 1024) .. "g"
	end
	return "  - " .. size .. " "
end

function M.get_file_size()
	local file = vim.fn.expand("%:p")
	if string.len(file) == 0 then return "" end
	return M.format_file_size(file)
end

-- show line:column
function M.line_column()
	local line = vim.fn.line(".")
	local column = vim.fn.virtcol(".")
	return line .. ":" .. column
end

return M
