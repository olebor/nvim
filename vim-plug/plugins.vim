" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
	if exists('g:vscode')
		" Easy motion for VSCode
		" Plug 'asvetliakov/vim-easymotion'
	else
		" Theme
		Plug 'dracula/vim'
		"Plug 'phanviet/vim-monokai-pro'

		" Auto pairs for '(' '[' '{'
		Plug 'jiangmiao/auto-pairs'
		" Language Client
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'neoclide/coc-eslint'

		" TypeScript Highlighting
		Plug 'leafgarland/typescript-vim'
		Plug 'peitalin/vim-jsx-typescript'

		" Better Syntax Support
		Plug 'sheerun/vim-polyglot'

		" File Explorer with Icons
		Plug 'scrooloose/nerdtree'
		Plug 'ryanoasis/vim-devicons'

		" File Search
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		"Plug 'yuki-ycind/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
		Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
		Plug 'junegunn/fzf.vim'
	
		Plug 'vim-airline/vim-airline'

		" Terraform
		Plug 'hashivim/vim-terraform'

		" Comment Block
		Plug 'preservim/nerdcommenter'

		" Start Screen
		Plug 'mhinz/vim-startify'
		" Git
		Plug 'airblade/vim-gitgutter'
		Plug 'tpope/vim-fugitive'
		Plug 'tpope/vim-rhubarb'
		Plug 'junegunn/gv.vim'
		Plug 'rhysd/git-messenger.vim'

		" Rainbow 
		Plug 'junegunn/rainbow_parentheses.vim'
		" Autoformat JS
		"Plug 'dense-analysis/ale'
	endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
