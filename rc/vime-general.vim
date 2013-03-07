" vim: fdm=marker:

" =============================================================
" General Settings
" =============================================================
" Disable backup and swapfile
set nobackup
set nowritebackup
set noswapfile

call InitializeDirectories()

set undolevels=1000 "maximum number of changes that can be undone

set autoread " auto reload file when it is changed outside
set autowrite " Write on make/shell commands
set autochdir " auto change current working directory

set clipboard+=unnamed " Yanks go on clipboard instead

set timeoutlen=500 " Time to wait for a command

" keep a lot of history
set history=500

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set fileformats=unix,mac,dos " Auto detect the file formats

" {{{ behavior
syntax on
filetype on
filetype plugin on
filetype indent on

set backspace=indent,eol,start " Make backspaces delete sensibly
set virtualedit=block,onemore " Allow for cursor beyond last character

" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu " 只在下拉菜单中显示匹配项目，并且会自动插入所有匹配项目的相同文本
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete
set omnifunc=syntaxcomplete#Complete

set modeline " Turn on modeline

" ----> Mouse Settings
set mousehide " Hide mouse after chars typed
set mouse=a " Mouse in all modes

set ve=block

" {{{ indentation options and tab converting
" Note: smartindent is seriously outdated. cindent, even, is unnecessary.
" Let the filetype plugins do the work.
set autoindent " Preserve current indent on new lines
" set cindent " set C style indent
set smartindent " Set smart indent
set shiftwidth=4 " Indent/outdent by four columns
set shiftround " Indent/outdent to nearest tabstop
set expandtab " Convert all tabs typed to spaces
set softtabstop=4 " Indentation levels every four columns
set tabstop=4
set smarttab
" }}}

" show matching enclosing chars
set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink
set matchpairs=(:),{:},[:],<:>

" arrow keys, bs, space wrap to next/prev line
set whichwrap=b,s,<,>,[,]

" Search Option
set magic     " Set magic on, for regular expressions
set mat=2     " How many tenths of a second to blink
set incsearch
" case insensitive search if all lowercase
set ignorecase smartcase

" line behavior
set wrap
set linebreak
set iskeyword+=_,$,@,%,#,-
" t: autowrap text using textwidth
" l: long lines are not broken in insert mode
" c: autowrap comments using textwidth, inserting leader
" r: insert comment leader after <CR>
" o: insert comment leader after o or O
set formatoptions+=rnlj
set formatoptions-=t
set textwidth=80


" context while scrolling
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

" backspace over anything
set backspace=indent,eol,start

" turn off bells, change to screen flash
" set visualbell
set novisualbell
set noerrorbells
set t_vb= " close visual bell

" show our whitespace
set list " Show these tabs and spaces and so on
set listchars=tab:\|\ ,nbsp:%,trail:-
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Change listchars
"set showbreak=↪  " Change wrap line break
set fillchars=diff:⣿,vert:│ " Change fillchars

" auto-complete in command mode
" complete to longest match, then list possibilities
" set wildmode=longest,list
" set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu

" {{{ options for diff mode
set diffopt=filler
set diffopt+=context:4
set diffopt+=iwhite
set diffopt+=vertical

if has('cursorbind') && &diff
  set cursorbind
end
"}}}

" don't duplicate an existing open buffer
set switchbuf=useopen

" }}}

" =============================================================
" User Interface
" =============================================================
" {{{ interface

" Set title
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Set gVim UI setting
if has('gui_running')
  "set guioptions=mcr         " 只显示菜单
  "set guioptions=            " 隐藏全部的gui选项
  "set guioptions+=r          " 显示gui右边滚动条
  set guioptions-=T           " 隐藏工具栏
  " set guioptions-=m         " 隐藏菜单栏
  " set guioptions-=r         " 删除右边的滚动条
  set guioptions-=R           " 如有垂直分割的窗口，删除右边的滚动条
  " set guioptions-=l         " 删除左边的滚动条
  set guioptions-=L           " 如有垂直分割的窗口，删除左边的滚动条
endif

" {{{ misc
set cmdheight=1 " Set the number of screen lines for command-line ( set ch=1 )
set colorcolumn=+1 " Indicate text border
" }}}

" {{{ statusline settings
set laststatus=2 " Show the statusline (set ls = 2)
" Use vim-powerline instead of the statuls line
" Note: see plugin-powerline.vim
" Set the style of the status line
" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]%=[%p%%\ line:\ %l\ of\ %L\ col:\ %v]
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
" set ruler " show ruler in status line
" set rulerformat=%15(%c%V\ %p%%%)
" set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
" set showmode "show current mode in status line
" }}}
"
" {{{ tab settings
set showtabline=2 " Always show tab line
set tabpagemax=15 " Set maximum number of tab pages
" Set up tab tooltips with every buffer name
if has('gui_running')
  set guitabtooltip=%F
  set guitablabel=%{GetShortTabLabel()} "Only show the file name
endif
" }}}

" ----> Highlighting Settings
" highlight search matches
set hlsearch

" highlight position of cursor
set cursorline " Highlight current line
" hi cursorline guibg=#0D142C
" hi cursorline guibg=#333333
" set cursorcolumn " Highlight the current column
" hi cursorcolumn guibg=#333333
" hi cursorcolumn guibg=#FCF5C9
" hi cursorcolumn guibg=#FCF5C9

" a - terse messages (like [+] instead of [Modified]
" t - truncate file names
" I - no intro message when starting vim fileless
" T - truncate long messages to avoid having to hit a key
set shortmess=atTI

" display the number of (characters|lines) in visual mode, also cur command
set showcmd

" max items in popup menu
set pumheight=8

" show number column
set number
set numberwidth=3

" {{{ fold settings
" show fold column, fold by markers
set foldcolumn=2
set foldmethod=marker
" set foldmethod=syntax
set foldlevelstart=0 " Start with all folds closed
let g:Foldtext_enable=1
" }}}

" }}}

" =============================================================
" Language-related Settings
" =============================================================
" Using Chinese help manuel
" Download vimcdoc from "http://vimcdoc.sourceforge.net/ first
" set helplang=cn " Chinese Help Documents

" {{{ encoding
" set encoding=utf-8 " Set utf-8 encoding

if has("multi_byte")
  set encoding=utf-8
  " English messages only
  " language messages zh_CN.utf-8

  set fencs=utf-8,gbk,chinese,latin1
  set nobomb

  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" on Windows, default charset is gbk
if has("win32")
  let g:fontsize#encoding = "cp936"
endif

" Work with Chinese input apps
"set noimdisable
"set imactivatekey=C-space
"set imsearch=0
"autocmd! InsertLeave * set imdisable|set iminsert=0
"autocmd! InsertEnter * set noimdisable|set iminsert=0
" }}}

" =============================================================
" AutoCmd
" =============================================================
" {{{ autocmd
if has("autocmd")
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
  auto InsertEnter * set nocursorline
  auto InsertLeave * set cursorline
  " autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
  " autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

  autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | mkview | endif
  autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | syntax on | endif

  " Only show trailing whitespace when not in insert mode
  augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
  augroup END

  " augroup vimrcEx " 记住上次文件位置
  " au!
  " autocmd FileType text setlocal textwidth=80
  " autocmd BufReadPost *
  " \ if line("'\"") > 0 && line("'\"") <= line("$") |
  " \   exe "normal g`\"" |
  " \ endif
  " augroup END

endif

" {{{ filetype dependent
autocmd BufNewFile,BufRead *.html setlocal commentstring=<!--%s-->
" ruby commenstring
autocmd FileType ruby setlocal commentstring=#%s
" make help navigation easier
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>

autocmd BufNewFile,BufRead * setlocal nospell
autocmd BufNewFile,BufRead *.cpp setlocal foldmethod=syntax

" QuickFix
augroup ft_quickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap textwidth=0
augroup END

" LESS
augroup ft_less
    autocmd!
    autocmd filetype less nnoremap <buffer> <Leader>r :w <BAR> !lessc % > %:t:r.css<CR><Space>
augroup END

" Python
augroup ft_python

    " Indent Python in the Google way.
    let s:maxoff = 50 " maximum number of lines to look backwards.
    function! GetGooglePythonIndent(lnum)
        " Indent inside parens.
        " Align with the open paren unless it is at the end of the line.
        " E.g.
        "   open_paren_not_at_EOL(100,
        "                         (200,
        "                          300),
        "                         400)
        "   open_paren_at_EOL(
        "       100, 200, 300, 400)
        call cursor(a:lnum, 1)
        let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
                    \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
                    \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
                    \ . " =~ '\\(Comment\\|String\\)$'")
        if par_line > 0
            call cursor(par_line, 1)
            if par_col != col("$") - 1
                return par_col
            endif
        endif
        " Delegate the rest to the original function.
        return GetPythonIndent(a:lnum)
    endfunction

    let pyindent_nested_paren="&sw*2"
    let pyindent_open_paren="&sw*2"

    autocmd!
    autocmd filetype python setlocal indentexpr=GetGooglePythonIndent(v:lnum)
    autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>

augroup END

" Perl
augroup ft_perl
    let perl_include_pod=1
    let perl_extended_vars=1
    let perl_sync_dist=250
    autocmd!
    autocmd filetype perl setlocal keywordprg=perldoc\ -f
augroup END
" }}}

" }}}

