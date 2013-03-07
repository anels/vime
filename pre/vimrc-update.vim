"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"             .vimrc of vime
"
"         Author: Anels<anelsliu@gmail.com>
"        Website: http://ruilinliu.com/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Get out of VI's compatible mode

if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $V = $VIM.'/_vimrc'
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif

" =============================================================
" Plug-ins Management
" =============================================================
source $VIMFILES/rc/vime-bundle.vim

" =============================================================
" Colorschemes and Fonts
" =============================================================
colorscheme slate

" font setting
set guifont=Inconsolata\ Medium\ 14
"set guifont=Source\ Code\ Pro\ Medium\ 12
"set guifont=Monospace\ 11
"set guifont=Ubuntu\ Mono\ 12

set textwidth=0
set showtabline=0
set nonumber
set nospell
