"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"             .vimrc of vime
"
"         Author: Anels<anelsliu@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Get out of VI's compatible mode

let $VIMEDIR = expand('<sfile>:p:h:h')

if has("win32") || has("win64")
    let $VIMFILES = $HOME.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif

source $VIMEDIR\\rc\\vime-plug.vim

set textwidth=0
set showtabline=0
set nonumber
set nospell
