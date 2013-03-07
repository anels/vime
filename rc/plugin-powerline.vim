" =============================================================
" Plug-in: Powerline
" =============================================================
" Homepage >
" github   > https://github.com/Lokaltog/vim-powerline
" Document > :help powerline
" =============================================================

" required
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
"set t_Co=256
"set statusline=\ [%n]\ \ %F%m%r\ \ %h%y%w\ \ [%l,%c]\ \ [%L]\ \ [%P]
let g:Powerline_stl_path_style = 'short'
" Set the style of the status line
" Use vim-powerline to modify the statuls line
if has('gui_running') && (!has('win64') || !has('win32'))
  "let g:Powerline_symbols = 'fancy'
  let g:Powerline_symbols='unicode'
  let g:Powerline_colorscheme = 'solarized256'
endif
