-- Example configuations here: https://github.com/mattn/efm-langserver
-- brew install efm-langserver
-- go get github.com/mattn/efm-langserver

-- lua
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

-- JavaScript/React/TypeScript
local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local prettier_global = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}


-- Shell
local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

-- markdown
local markdownlint = {
    -- TODO default to global lintrc
    -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
    lintCommand = 'markdownlint -s',
    lintStdin = true,
    lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
	cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {luaFormat},
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
            javascriptreact = {eslint},
            javascript = {prettier_global},
            sh = {shellcheck, shfmt},
            html = {prettier_global},
            css = {prettier_global},
            json = {prettier_global},
            yaml = {prettier_global},
            -- markdown = {markdownPandocFormat, markdownlint},
            -- markdown = {markdownPandocFormat}
        }
    }
}

-- Also find way to toggle format on save
-- maybe this will help: https://superuser.com/questions/439078/how-to-disable-autocmd-or-augroup-in-vim
