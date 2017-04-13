" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" {{{ Colorschemes
Plug 'jdevera/vim-cs-explorer'
nnoremap <Leader>ec :ColorSchemeExplorer<CR>



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

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'

" }}}


Plug 'sjl/gundo.vim'
nnoremap <Leader>u :GundoToggle<CR>


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
let g:formatter_yapf_style = 'google'
let g:autoformat_verbosemode=1
let g:formatterpath = ['/Programs/astyle/build/gcc/bin']

if executable('ctags')
    Plug 'majutsushi/tagbar'
    " Plugin 'xolox/vim-easytags'
endif

" Plugin 'anels/vim-foldline'

" Plugin 'xuhdev/SingleCompile'


" {{{ Plugin Configuration
source $VIMFILES/rc/plugin-ctrlp.vim
source $VIMFILES/rc/plugin-fugitive.vim
source $VIMFILES/rc/plugin-indentguide.vim
source $VIMFILES/rc/plugin-latex-suite.vim
source $VIMFILES/rc/plugin-neocomplcache.vim
source $VIMFILES/rc/plugin-nerdcommenter.vim
source $VIMFILES/rc/plugin-nerdtree.vim
source $VIMFILES/rc/plugin-rainbow-parentheses.vim
source $VIMFILES/rc/plugin-syntastic.vim
source $VIMFILES/rc/plugin-tagbar.vim
source $VIMFILES/rc/plugin-tabular.vim

" }}}


call plug#end()

