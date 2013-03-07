" =============================================================
" Plug-in: Syntastic
" =============================================================
" Syntax check that runs files through external syntax checkers
" Homepage > http://
" github   > https://github.com/scrooloose/syntastic
" Document > :help syntastic
" =============================================================

nnoremap <Leader>se :Errors<CR>

let g:syntastic_check_on_open=1
" let g:syntastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

let g:syntastic_cpp_compiler_options = ' -std=c++0x'
