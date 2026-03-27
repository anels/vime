" vim: fdm=marker:

" ==================================================================
" GENERAL SETTINGS {{{1
" ==================================================================
" Core behaviors
syntax enable
filetype plugin indent on
set hidden                     " Allow switching between unsaved buffers
set history=10000              " Larger history
set timeoutlen=500             " Key timeout for mappings
set updatetime=300             " Faster plugin responsiveness
set backspace=indent,eol,start " Backspace works as expected
set virtualedit=block          " Only allow virtual edit in visual block mode

" File handling {{{2
set autoread autowrite         " Auto-read/write files when modified
" set autochdir               " Commented out as it can interfere with some plugins
set viewoptions+=slash,unix
set fileformats=unix,mac,dos

" Backup, swap and undo {{{2
set nobackup nowritebackup noswapfile  " No backup or swap files
set undofile                           " Persistent undo history
set undolevels=1000                    " Maximum undo changes
set undodir=$HOME/vimfiles/undo        " Windows path for undo files

" Input and clipboard {{{2
set clipboard^=unnamed,unnamedplus     " Use system clipboard
set mouse=a mousehide                  " Enable mouse, hide while typing
set whichwrap=b,s,<,>,[,]              " Allow movement keys to wrap

" ==================================================================
" VISUAL APPEARANCE {{{1
" ==================================================================
" User interface
set title                      " Show filename in window title
set laststatus=2               " Always show statusline
set cmdheight=1                " Command line height
set shortmess+=atTI            " Shorter messages
set number numberwidth=3       " Line numbers
set cursorline                 " Highlight current line
set signcolumn=yes             " Always show sign column
set colorcolumn=+1             " Show column guideline based on textwidth

" Visual indicators {{{2
set showmatch matchtime=2      " Briefly jump to matching bracket
set matchpairs+=<:>            " Add <> to matching pairs
set list                       " Show invisible characters
set listchars=tab:│\ ,trail:·,extends:❯,precedes:❮
set showbreak=↪                " Indicator for wrapped lines

" Completion and menus {{{2
set pumheight=10               " Maximum number of popup menu items
set wildmenu                   " Command-line completion menu
set wildmode=longest:full,full " Complete longest common string, then each full match
set complete=.,w,b,k,t,i       " Completion sources
set completeopt=menu,menuone,longest,noselect
set omnifunc=syntaxcomplete#Complete

" Notifications {{{2
set belloff=all                " Disable all bells
set t_vb=                      " Visual bell terminal code

" ==================================================================
" TEXT EDITING {{{1
" ==================================================================
" Indentation
set autoindent                 " Copy indent from current line when starting a new line
set shiftwidth=4 shiftround    " Number of spaces for indentation
set expandtab softtabstop=4 tabstop=4  " Tab behavior
set smarttab                   " Tab respects 'shiftwidth', 'tabstop', 'softtabstop'

" Text formatting {{{2
set wrap linebreak             " Wrap long lines at word boundaries
set textwidth=80               " Maximum width of text
set formatoptions+=jn          " Better join behavior and number recognition
set formatoptions-=t           " Don't auto-wrap text
set scrolloff=3 sidescrolloff=10  " Minimal number of screen lines around cursor
set sidescroll=1               " Minimum columns to scroll horizontally

" Search {{{2
set incsearch hlsearch         " Incremental search and highlight results
set ignorecase smartcase       " Case-insensitive search unless capitals used
set magic                      " Use extended regex with special chars

" Folding {{{2
set foldmethod=marker          " Fold based on markers
set foldlevelstart=0           " Close all folds by default
set foldcolumn=2               " Show fold column

" Diff mode {{{2
set diffopt=filler,internal,algorithm:histogram,indent-heuristic

" ==================================================================
" PLATFORM-SPECIFIC SETTINGS {{{1
" ==================================================================
" Encoding
if has('multi_byte')
  set encoding=utf-8
  set fileencodings=utf-8,gbk,chinese,latin1
  set nobomb
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif
endif

" Windows specific
if has('win32') || has('win64')
  let g:fontsize#encoding = 'cp936'
endif

" GUI settings
if has('gui_running')
  set guioptions-=T            " No toolbar
  set guioptions-=r            " No right scrollbar
  set guioptions-=L            " No left scrollbar
  set guioptions-=m            " No menu
endif

" ==================================================================
" AUTOCOMMANDS {{{1
" ==================================================================
if has('autocmd')
  augroup vimrc_general
    autocmd!
    " Cursor line only in active window and not in insert mode
    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline

    " Only show trailing whitespace when not in insert mode
    autocmd InsertEnter * setlocal listchars-=trail:·
    autocmd InsertLeave * setlocal listchars+=trail:·
  augroup END
endif
" }}}