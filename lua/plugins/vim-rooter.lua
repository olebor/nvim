-- Detect root of project
-- Will automatically set the working directory to the project root
-- when you open a file in a project.
return {
	"airblade/vim-rooter",

	config = function()
		vim.g.rooter_silent_chdir = 1
		vim.g.rooter_patterns = { ".git" }
	end,
}
