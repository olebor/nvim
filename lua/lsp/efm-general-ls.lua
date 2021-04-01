-- Example configuations here: https://github.com/mattn/efm-langserver
-- TODO this file needs to be refactored eache lang should be it's own file

-------------------------------------------------------------------------------
--
-- lua
--
-------------------------------------------------------------------------------
local lua_arguments = {}
local luaFormat = {
	formatCommand = "lua-format -i --no-keep-simple-function-one-line --indent-width=1 --use-tab --column-limit=120",
	formatStdin = true
}

if O.lua.formatter == 'lua-format' then table.insert(lua_arguments, luaFormat) end

-------------------------------------------------------------------------------
--
-- Shell Scripts
--
-------------------------------------------------------------------------------
local sh_arguments = {}

local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

local shellcheck = {
	LintCommand = 'shellcheck -f gcc -x',
	lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

if O.sh.formatter == 'shfmt' then table.insert(sh_arguments, shfmt) end

if O.sh.linter == 'shellcheck' then table.insert(sh_arguments, shellcheck) end

-------------------------------------------------------------------------------
-- JavaScript/TypeScript
--
-- Requre eslint_d installed globally: npm install -g eslint_d
-- eslint cannot be used directly due to the fact that it will not output any
-- source if the code has no fixable items.
--
-------------------------------------------------------------------------------
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
	lintCommand = "npx eslint -f unix --stdin --stdin-filename ${INPUT}",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = {"%f:%l:%c: %m"},
	formatCommand = "eslint_d --stdin --stdin-filename ${INPUT} --fix-to-stdout",
	formatStdin = true
}

local tsserver_args = {}

table.insert(tsserver_args, prettier)
table.insert(tsserver_args, eslint)

-------------------------------------------------------------------------------
-- Markdown
-------------------------------------------------------------------------------

-- local markdownlint = {
--     -- TODO default to global lintrc
--     -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
--     lintCommand = 'markdownlint -s',
--     lintStdin = true,
--     lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
-- }

local markdownPandocFormat = {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}


-------------------------------------------------------------------------------
--
-- Configure EFM
--
-------------------------------------------------------------------------------

require"lspconfig".efm.setup {
	-- init_options = {initializationOptions},
	cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
	init_options = {documentFormatting = true, codeAction = false},
	filetypes = {"lua", "typescript", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
	settings = {
		rootMarkers = {".git/"},
		languages = {
			lua = lua_arguments,
			sh = sh_arguments,
			typescript = tsserver_args,
			typescriptreact = tsserver_args,
			javascript = tsserver_args,
			javascriptreact = tsserver_args,
			html = {prettier},
			css = {prettier},
			json = {prettier},
			yaml = {prettier},
			markdown = {markdownPandocFormat}
			-- javascriptreact = {prettier, eslint},
			-- javascript = {prettier, eslint},
			-- markdown = {markdownPandocFormat, markdownlint},
		}
	}
}

-- Also find way to toggle format on save
-- maybe this will help: https://superuser.com/questions/439078/how-to-disable-autocmd-or-augroup-in-vim

