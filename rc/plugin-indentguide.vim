" =============================================================
" Plug-in: Indent Guides
" =============================================================
" Show indent guide lines
" Homepage > http://
" github   > https://github.com/nathanaelkane/vim-indent-guides
" Document > :help indent_guides.txt
" =============================================================

" if !has('gui_running')
" let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
" endif

let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_guide_size=2

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=4

nnoremap <Leader>ig :IndentGuidesToggle<CR>
