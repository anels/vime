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
Bundle 'gmarik/ingretu'
Bundle 'molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'w0ng/vim-hybrid'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'jdevera/vim-cs-explorer'
" }}}

" {{{ UI Related
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'sjl/gundo.vim'
Bundle 'bling/vim-airline'
" }}}

" {{{ Auto Complete and Snippets
Bundle 'Shougo/neocomplcache'
Bundle 'SirVer/ultisnips'
Bundle 'ervandew/supertab'
" }}}

" {{{ Automatic Helper
Bundle 'scrooloose/syntastic'
" Bundle 'Raimondi/delimitMate'
" Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'The-NERD-Commenter'
" }}}

" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'a.vim'

" Other
Bundle 'Shougo/unite.vim'
Bundle 'kien/ctrlp.vim'
" Bundle 'vimwiki'
" Bundle 'LanguageTool'

Bundle 'tpope/vim-fugitive'

Bundle "Chiel92/vim-autoformat"

if executable('ctags')
  Bundle 'majutsushi/tagbar'
  " Bundle 'xolox/vim-easytags'
endif

Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'suan/vim-instant-markdown'
Bundle 'tpope/vim-markdown'
" Bundle 'anels/vim-foldline'

" Bundle 'xuhdev/SingleCompile'

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
