local api = vim.api


-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})


-- Folding

local allFilesGrp = api.nvim_create_augroup('all_files', { clear = true })
--
api.nvim_create_autocmd("BufRead", {
	command = ":set foldlevel=20",
	group = allFilesGrp
})


local jstsFilesGrp = api.nvim_create_augroup('filetype_js_ts', { clear = true })

api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript" },
	command = ":set foldmethod=expr",
	group = jstsFilesGrp
})

api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript" },
	command = ":set foldexpr=nvim_treesitter#foldexpr()",
	group = jstsFilesGrp
})

