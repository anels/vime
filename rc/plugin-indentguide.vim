" =============================================================
" Plug-in: Indent Guides
" =============================================================
" Show indent guide lines
" Homepage > http://
" github   > https://github.com/mutewinter/vim-indent-guides
" Document > :help indent_guides
" =============================================================

" if !has('gui_running')
    " let g:indent_guides_auto_colors=0
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
" endif

let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_guide_size=1

nnoremap <Leader>ig :IndentGuidesToggle<CR>
