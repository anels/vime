"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"             .vimrc of vime
"
"         Author: Anels<anelsliu@gmail.com>
"        Website: http://ruilinliu.com/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Get out of VI's compatible mode

let $VIMEDIR = $HOME.'/vime'

if has("win32") || has("win64") 
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif

source $VIMEDIR\\rc\\vime-plug.vim

set textwidth=0
set showtabline=0
set nonumber
set nospell
