" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin($VIMFILES.'//plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" {{{ Colorschemes
Plug 'jdevera/vim-cs-explorer'
"nnoremap <Leader>ec :ColorSchemeExplorer<CR>


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
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_guide_size=2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=4

nnoremap <Leader>ig :IndentGuidesToggle<CR>

Plug 'ryanoasis/vim-devicons'

Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
" }}}


"Plug 'sjl/gundo.vim' " requires python 2.x
"nnoremap <Leader>u :GundoToggle<CR>

Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif


" {{{ Auto Complete and Snippets
Plug 'Shougo/neocomplcache'
" Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'ervandew/supertab'
" }}}

" {{{ Automatic Helper
Plug 'scrooloose/syntastic'
nnoremap <Leader>se :Errors<CR>
let g:syntastic_check_on_open=1
" let g:syntastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_cpp_compiler_options = ' -std=c++0x'


" Plugin 'Raimondi/delimitMate'
" Plugin 'tpope/vim-surround'
Plug 'godlygeek/tabular'
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>




Plug 'scrooloose/nerdcommenter'
" }}}

" Navigation
Plug 'scrooloose/nerdtree', "{ 'on':  'NERDTreeToggle' }
nnoremap <leader>w :NERDTree<CR>
nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\.o$', '\~$']

Plug 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup = 0

" Plugin 'xuhdev/SingleCompile'
if executable('git')
    Plug 'tpope/vim-fugitive'
    " nnoremap <silent> <leader>gs :Gstatus<CR>
    " nnoremap <silent> <leader>gd :Gdiff<CR>
    " nnoremap <silent> <leader>gc :Gcommit<CR>
    " nnoremap <silent> <leader>gb :Gblame<CR>
    " nnoremap <silent> <leader>gl :Glog<CR>
    " nnoremap <silent> <leader>gp :Git push<CR>
endif

Plug 'Chiel92/vim-autoformat'
let g:formatter_yapf_style = 'google'
let g:autoformat_verbosemode=1
"let g:formatterpath = ['/Programs/astyle/build/gcc/bin']
let g:formatterpath = ['C:\Users\ruilliu\AStyle\bin']
noremap <F6> :Autoformat<CR> "require plugin 'Chiel92/vim-autoformat'



"Plug 'vimwiki/vimwiki'


" New
"Plug 'plasticboy/vim-markdown'
Plug 'szw/vim-maximizer'
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

if executable('ctags')
    Plug 'majutsushi/tagbar'
    nnoremap <F10> :TagbarToggle<CR>
    let g:tagbar_autofocus=1
    let g:tagbar_expand=1
    let g:tagbar_foldlevel=2
    let g:tagbar_ironchars=['▾', '▸']
    let g:tagbar_autoshowtag=1
endif


Plug 'rhysd/vim-grammarous'


" {{{ Plugin Configuration
"source $VIMEDIR/rc/plugin-latex-suite.vim
"autocmd BufNewFile,BufRead *.tex source $VIMEDIR/rc/filetype-tex.vim
"source $VIMEDIR/rc/plugin-neocomplcache.vim
" }}}


call plug#end()

