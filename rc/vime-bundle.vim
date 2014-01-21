" =============================================================
" Plug-ins
" =============================================================
" vime using Vundle to manage plugins

filetype off " Required!
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

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
" Bundle 'Lokaltog/vim-powerline'
Bundle 'mutewinter/vim-indent-guides'
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
" Bundle 'xolox/vim-notes'
Bundle 'LanguageTool'

Bundle 'tpope/vim-fugitive'

if executable('ctags')
  Bundle 'majutsushi/tagbar'
  " Bundle 'xolox/vim-easytags'
endif

Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'suan/vim-instant-markdown'
Bundle 'tpope/vim-markdown'
Bundle 'anels/vim-foldline'

" Bundle 'xuhdev/SingleCompile'
