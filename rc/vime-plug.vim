" vim: fdm=marker:

" ==================================================================
" PLUGIN MANAGEMENT {{{1
" ==================================================================
call plug#begin()

" ==================================================================
" APPEARANCE PLUGINS {{{2
" ==================================================================

" Colorschemes {{{3
Plug 'jdevera/vim-cs-explorer'
"nnoremap <Leader>ec :ColorSchemeExplorer<CR>

" 256-color terminal schemes
Plug 'gmarik/ingretu'
Plug 'Lokaltog/vim-distinguished'

" GUI dark schemes
Plug 'tomasr/molokai'

" GUI light schemes
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'

" Modern schemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'ghifarit53/tokyonight-vim'
" }}}

" UI Enhancements {{{3
" Start screen for vim
Plug 'mhinz/vim-startify'

" Show indent guides
Plug 'nathanaelkane/vim-indent-guides'
" {{{ vim-indent-guides settings
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=4
nnoremap <Leader>ig :IndentGuidesToggle<CR>
" }}}

" File icons
Plug 'ryanoasis/vim-devicons'

" Rainbow parentheses for nested brackets/braces
Plug 'kien/rainbow_parentheses.vim'
" {{{ rainbow_parentheses settings
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}

" Status line enhancement
Plug 'itchyny/lightline.vim'
" {{{ lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" }}}

" Undo history visualizer
Plug 'mbbill/undotree'
" {{{ undotree settings
nnoremap <Leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=$HOME/vimfiles/undo/    " Updated to match general.vim
    set undofile
endif
" }}}
" }}}

" ==================================================================
" CODE EDITING PLUGINS {{{2
" ==================================================================

" Auto-completion {{{3
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" {{{ coc.nvim settings
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}
" }}}

" Snippet support (commented out but kept for reference)
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'ervandew/supertab'
" }}}

" Code quality and formatting {{{3
" Syntax checking
" Syntax checking using ALE is done below (dense-analysis/ale)

" Text alignment
Plug 'godlygeek/tabular'
" {{{ tabular settings
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
" }}}

" Code commenting
Plug 'scrooloose/nerdcommenter'

" Code linting
Plug 'dense-analysis/ale'

" Python indentation
Plug 'tweekmonster/braceless.vim'

" Auto-pairing
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
" }}}

" ==================================================================
" NAVIGATION AND PROJECT TOOLS {{{2
" ==================================================================

" File explorer {{{3
Plug 'scrooloose/nerdtree'
" {{{ nerdtree settings
nnoremap <leader>w :NERDTree<CR>
nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.o$', '\~$']
" }}}

" NERDTree tabs integration
Plug 'jistr/vim-nerdtree-tabs'
" {{{ vim-nerdtree-tabs settings
let g:nerdtree_tabs_open_on_gui_startup = 0
" }}}

" Fuzzy finder {{{3
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <C-j> :Tags<CR>
" }}}

" Git integration {{{3
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Git status in gutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_terminal_reports_focus = 0
" }}}

" Window management {{{3
" Maximize/restore windows
Plug 'szw/vim-maximizer'
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>
" }}}

" Code navigation {{{3
" Code outline/structure viewer
Plug 'majutsushi/tagbar'
nnoremap <F10> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_expand = 1
let g:tagbar_foldlevel = 2
let g:tagbar_ironchars = ['▾', '▸']
let g:tagbar_autoshowtag = 1
" }}}

" Additional tools (commented out but kept for reference) {{{3
" Markdown support
" Plug 'plasticboy/vim-markdown'

" Single file compilation
" Plug 'xuhdev/SingleCompile'

" Auto-formatting (requires Python)
" Plug 'Chiel92/vim-autoformat'
" let g:autoformat_autoindent = 0
" let g:autoformat_remove_trailing_spaces = 0
" let g:autoformat_retab = 0
" let g:autoformat_verbosemode = 1
" let g:formatter_yapf_style = 'google'
" let g:formatterpath = ['$HOME\scoop\apps\astyle\current\bin']
" noremap <F6> :Autoformat<CR>

" Grammar checking
" Plug 'rhysd/vim-grammarous'
" let g:grammarous#languagetool_cmd = 'languagetool'
" usage: ':[range]GrammarousCheck [--lang={lang}] [--(no-)preview] [--(no-)comments-only]'
" }}}

call plug#end()
" }}}
