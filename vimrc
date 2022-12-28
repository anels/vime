"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"             .vimrc of vime
"
"         Author: Anels<anelsliu@gmail.com>
"          Since: 2012-01-27
"  Last Modified: 2021-08-24 9:33:57 PM
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Get out of VI's compatible mode

let $VIMEDIR = $HOME.'/vime'
let $VIMFILES = $HOME.'/vimfiles'

" {{{ Vime Configuration
source $VIMEDIR\\rc\\vime-function.vim
source $VIMEDIR\\rc\\vime-general.vim
source $VIMEDIR\\rc\\vime-shortcut.vim
source $VIMEDIR\\rc\\vime-plug.vim
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
  colorscheme evening
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
    "set guifont=Inconsolata:h20:cANSI
    "set guifont=JetBrains_Mono_NL:h14:cANSI:qDRAFT
    set guifont=Cascadia_Code_PL:h14:cANSI:qDRAFT
  endif
endif

" =============================================================
" AutoCmd
" =============================================================
autocmd BufWrite,BufWritePre,FileWritePre $MYVIMRC ks|call LastModified()|'s

" Source the vimrc file after saving it
" autocmd BufWritePost .vimrc source $MYVIMRC

" vim: fdm=marker:
