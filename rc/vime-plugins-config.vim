" Plug 'jdevera/vim-cs-explorer'
nnoremap <Leader>ec :ColorSchemeExplorer<CR>

" Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'



" {{{ Plugin Configuration
source $VIMFILES/rc/plugin-ctrlp.vim
source $VIMFILES/rc/plugin-fugitive.vim
source $VIMFILES/rc/plugin-gundo.vim
source $VIMFILES/rc/plugin-indentguide.vim
source $VIMFILES/rc/plugin-latex-suite.vim
source $VIMFILES/rc/plugin-neocomplcache.vim
source $VIMFILES/rc/plugin-nerdcommenter.vim
source $VIMFILES/rc/plugin-nerdtree.vim
source $VIMFILES/rc/plugin-rainbow-parentheses.vim
source $VIMFILES/rc/plugin-syntastic.vim
source $VIMFILES/rc/plugin-tagbar.vim
source $VIMFILES/rc/plugin-tabular.vim

" }}}

