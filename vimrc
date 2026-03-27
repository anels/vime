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

let $VIMEDIR = expand('<sfile>:p:h')
let $VIMFILES = $HOME.'/vimfiles'

" {{{ Vime Configuration
source $VIMEDIR/rc/vime-function.vim
source $VIMEDIR/rc/vime-general.vim
source $VIMEDIR/rc/vime-shortcut.vim
source $VIMEDIR/rc/vime-plug.vim
" }}}

" Version-specific settings
if v:version >= 800
  " Vim 8+ specific settings
  set belloff=all  " No bells please
endif

" File management
set hidden         " Better buffer management - allows switching buffers without saving
set backupdir=$VIMEDIR/backup//
set directory=$VIMEDIR/swap//

" Encoding settings
set encoding=utf-8
set fileencoding=utf-8

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
    "set guifont=SauceCodePro_NFM:h14:cANSI:qDRAFT
    set guifont=JetBrainsMono_NFM_Medium:h16:W500:cANSI:qDRAFT
  endif
endif

" =============================================================
" AutoCmd
" =============================================================
autocmd BufWrite,BufWritePre,FileWritePre $MYVIMRC ks|call LastModified()|'s

" Source the vimrc file after saving it
autocmd BufWritePost .vimrc source $MYVIMRC

" vim: fdm=marker:
