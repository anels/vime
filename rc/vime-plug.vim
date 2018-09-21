" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin($VIMFILES.'/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" {{{ Colorschemes
Plug 'jdevera/vim-cs-explorer'
nnoremap <Leader>ec :ColorSchemeExplorer<CR>


" 256-color
Plug 'gmarik/ingretu'
Plug 'Lokaltog/vim-distinguished'
" gvim-dark
Plug 'tomasr/molokai'
" gvim-light
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
" gvim
Plug 'chriskempson/vim-tomorrow-theme'
" }}}

" {{{ UI Related
Plug 'nathanaelkane/vim-indent-guides'

Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces




Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'

" }}}


Plug 'sjl/gundo.vim'
nnoremap <Leader>u :GundoToggle<CR>


" {{{ Auto Complete and Snippets
Plug 'Shougo/neocomplcache'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
" }}}

" {{{ Automatic Helper
Plug 'scrooloose/syntastic'
" Plugin 'Raimondi/delimitMate'
" Plugin 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
" }}}

" Navigation
Plug 'scrooloose/nerdtree', "{ 'on':  'NERDTreeToggle' }
nnoremap <leader>w :NERDTree<CR>
nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\.o$', '\~$']


Plug 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup = 0

" Other
Plug 'kien/ctrlp.vim'

" Plug 'tpope/vim-fugitive'

Plug 'Chiel92/vim-autoformat'
let g:formatter_yapf_style = 'google'
let g:autoformat_verbosemode=1
let g:formatterpath = ['/Programs/astyle/build/gcc/bin']
noremap <F3> :Autoformat<CR><CR> " require plugin 'Chiel92/vim-autoformat'


" New 
Plug 'plasticboy/vim-markdown'
Plug 'szw/vim-maximizer'
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>


if executable('ctags')
  Plug 'majutsushi/tagbar'
  source $VIMFILES/rc/plugin-tagbar.vim
endif

" Plugin 'anels/vim-foldline'

" Plugin 'xuhdev/SingleCompile'

" {{{ Plugin Configuration
source $VIMEDIR\rc\plugin-ctrlp.vim
" source $VIMFILES\rc\plugin-fugitive.vim
source $VIMEDIR\rc\plugin-indentguide.vim
source $VIMEDIR\rc\plugin-latex-suite.vim
source $VIMEDIR\rc\plugin-neocomplcache.vim
source $VIMEDIR\rc\plugin-nerdcommenter.vim
source $VIMEDIR\rc\plugin-syntastic.vim
source $VIMEDIR\rc\plugin-tabular.vim

" }}}


call plug#end()

