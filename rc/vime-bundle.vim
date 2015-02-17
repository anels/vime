" =============================================================
" Plug-ins
" =============================================================
" vime using Vundle to manage plugins

filetype off " Required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" {{{ Colorschemes
Plugin 'gmarik/ingretu'
Plugin 'molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'jdevera/vim-cs-explorer'
" }}}

" {{{ UI Related
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'sjl/gundo.vim'
Plugin 'bling/vim-airline'
" }}}

" {{{ Auto Complete and Snippets
Plugin 'Shougo/neocomplcache'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
" }}}

" {{{ Automatic Helper
Plugin 'scrooloose/syntastic'
" Plugin 'Raimondi/delimitMate'
" Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'The-NERD-Commenter'
" }}}

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'a.vim'

" Other
Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'
" Plugin 'vimwiki'
" Plugin 'LanguageTool'

Plugin 'tpope/vim-fugitive'

Plugin 'Chiel92/vim-autoformat'

if executable('ctags')
  Plugin 'majutsushi/tagbar'
  " Plugin 'xolox/vim-easytags'
endif

Plugin 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-markdown'
" Plugin 'anels/vim-foldline'

" Plugin 'xuhdev/SingleCompile'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" {{{ Plugin Configuration
source $VIMFILES/rc/plugin-ctrlp.vim
source $VIMFILES/rc/plugin-fugitive.vim
source $VIMFILES/rc/plugin-gundo.vim
source $VIMFILES/rc/plugin-indentguide.vim
" source $VIMFILES/rc/plugin-languagetool.vim
source $VIMFILES/rc/plugin-latex-suite.vim
source $VIMFILES/rc/plugin-neocomplcache.vim
source $VIMFILES/rc/plugin-nerdcommenter.vim
source $VIMFILES/rc/plugin-nerdtree.vim
source $VIMFILES/rc/plugin-airline.vim
source $VIMFILES/rc/plugin-rainbow-parentheses.vim
source $VIMFILES/rc/plugin-syntastic.vim
source $VIMFILES/rc/plugin-tagbar.vim
source $VIMFILES/rc/plugin-unite.vim
source $VIMFILES/rc/plugin-tabular.vim

" source $VIMFILES/rc/plugin-vimwiki.vim
" }}}
