"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"             .vimrc of vime
"
"         Author: Anels<anelsliu@gmail.com>
"        Website: http://ruilinliu.com/
"          Since: 2012-01-27
"  Last Modified: 2014-04-10 04:11:03 PM
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Get out of VI's compatible mode

if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif

" =============================================================
" Plug-ins Management
" =============================================================
" Bundles {{{

" Use default bundles config
source $VIMFILES/rc/vime-bundle.vim

" Use local bundles if available
if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif


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
    set guifont=Ubuntu\ Mono\ 12
    set guifontwide=WenQuanYi\ Zen\ Hei\ Medium\ 14
  elseif has('gui_macvim')
    set guifont=Monaco:h11
  elseif has('gui_win32')
    set guifont=Consolas:h11:cANSI
  endif
endif

" =============================================================
" Advanced Settings
" =============================================================

" {{{ Platform Specific Configuration

if has('win32') || has('win64')
  source $VIMFILES/rc/vime-win.vim
endif

if has("mac") || has("gui_macvim")
  source $VIMFILES/rc/vime-mac.vim
endif
" }}}

" {{{ Vime Configuration
source $VIMFILES/rc/vime-function.vim
source $VIMFILES/rc/vime-general.vim
source $VIMFILES/rc/vime-shortcut.vim
" }}}

autocmd BufNewFile,BufRead *.tex source $VIMFILES/rc/filetype-tex.vim

" Use local bundles if available
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


" =============================================================
" AutoCmd
" =============================================================
autocmd BufWrite,BufWritePre,FileWritePre $MYVIMRC ks|call LastModified()|'s

" Source the vimrc file after saving it
" autocmd BufWritePost .vimrc source $MYVIMRC

" vim: fdm=marker:
