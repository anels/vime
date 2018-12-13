"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"             .vimrc of vime
"
"         Author: Anels<anelsliu@gmail.com>
"        Website: http://ruilinliu.com/
"          Since: 2012-01-27
"  Last Modified: 2018-09-21 1:55:34 PM
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Get out of VI's compatible mode

let $VIMEDIR = $HOME.'/vime'
let $VIMFILES = $HOME.'/vimfiles'

" if has("win32") || has("win64") 
    " let $VIMFILES = $HOME.'\vime'
" else
    " let $VIMFILES = $HOME.'/vime'
" endif

" {{{ Vime Configuration
source $VIMEDIR\rc\vime-function.vim
source $VIMEDIR\rc\vime-general.vim
source $VIMEDIR\rc\vime-shortcut.vim
source $VIMEDIR\rc\vime-plug.vim
" }}}



" =============================================================
" Colorschemes and Fonts
" =============================================================
" colorscheme setting
if has('gui_running')
  "colo evening
  colorscheme molokai
else
  set t_Co=256 " Use 256 colors
  "colorscheme distinguished
  colorscheme koehler
endif

" font setting
" Tips: use ":set guifont" to see the current guifont
if has('gui_running')
  if has('gui_gtk')
    " set guifont=Inconsolata\ Medium\ 14
    " set guifont=Source\ Code\ Pro\ Medium\ 12
    " set guifont=Monospace\ 11
    set guifont=Ubuntu\ Mono\ 10
    set guifontwide=WenQuanYi\ Zen\ Hei\ Medium\ 12
  elseif has('gui_macvim')
    set guifont=Monaco:h11
  elseif has('gui_win32') || has('gui_win64')
    "set guifont=Consolas:h11:cANSI
    set guifont=Inconsolata:h13:cANSI
  endif
endif


" =============================================================
" AutoCmd
" =============================================================
autocmd BufWrite,BufWritePre,FileWritePre $MYVIMRC ks|call LastModified()|'s

" Source the vimrc file after saving it
" autocmd BufWritePost .vimrc source $MYVIMRC

" vim: fdm=marker:
