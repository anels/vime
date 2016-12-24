" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" {{{ Colorschemes
Plug 'jdevera/vim-cs-explorer'
" 256-color
Plug 'gmarik/ingretu'
Plug 'Lokaltog/vim-distinguished'
" gvim-dark
Plug 'molokai'
" gvim-light
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
" gvim
Plug 'chriskempson/vim-tomorrow-theme'
" }}}

" {{{ UI Related
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sjl/gundo.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}

" {{{ Auto Complete and Snippets
Plug 'Shougo/neocomplcache'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
" }}}

" {{{ Automatic Helper
Plug 'scrooloose/syntastic'
" Plugin 'Raimondi/delimitMate'
" Plugin 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'The-NERD-Commenter'
" }}}

" Navigation
Plug 'scrooloose/nerdtree', "{ 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'a.vim'

" Other
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'

Plug 'Chiel92/vim-autoformat'

if executable('ctags')
  Plug 'majutsushi/tagbar'
  " Plugin 'xolox/vim-easytags'
endif

" Plugin 'anels/vim-foldline'

" Plugin 'xuhdev/SingleCompile'



call plug#end()

