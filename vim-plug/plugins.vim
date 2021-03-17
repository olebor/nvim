" Autoinstall vim-plug 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
	if exists('g:vscode')
		" Section for VSCode Plugins
	else
		" Theme and visuals
		" Plug 'dracula/vim'
		Plug 'phanviet/vim-monokai-pro'
		" Plug 'morhetz/gruvbox'
		Plug 'tomasr/molokai'
		Plug 'erichain/vim-monokai-pro'

		" Cool Icons
		Plug 'kyazdani42/nvim-web-devicons'
		Plug 'ryanoasis/vim-devicons'
		" Easymotion
		Plug 'easymotion/vim-easymotion'

		" Auto pairs for '(' '[' '{'
		Plug 'jiangmiao/auto-pairs'

		" Language Tools 
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'neoclide/coc-eslint'

		" TypeScript Highlighting
		Plug 'leafgarland/typescript-vim'
		Plug 'peitalin/vim-jsx-typescript'

		" Better Syntax Support
		Plug 'sheerun/vim-polyglot'

		" Bar with icons and stuff
		Plug 'romgrk/barbar.nvim'

		" File Search
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
		Plug 'junegunn/fzf.vim'
		Plug 'airblade/vim-rooter'
	
		Plug 'vim-airline/vim-airline'

		" Smooth scroll
		Plug 'psliwka/vim-smoothie'
	
		" Terraform
		Plug 'hashivim/vim-terraform'

		" Comment Block
		Plug 'preservim/nerdcommenter'

		" Start Screen
		Plug 'mhinz/vim-startify'
		" See what keys do like in emacs
		Plug 'liuchengxu/vim-which-key'

		" Git
		Plug 'airblade/vim-gitgutter'
		Plug 'tpope/vim-fugitive'
		Plug 'tpope/vim-rhubarb'
		Plug 'junegunn/gv.vim'
		Plug 'rhysd/git-messenger.vim'
		" Terminal
		Plug 'voldikss/vim-floaterm'
		" Rainbow 
		Plug 'junegunn/rainbow_parentheses.vim'
	endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
