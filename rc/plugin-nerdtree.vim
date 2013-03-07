" NERD_tree
" https://github.com/scrooloose/nerdtree
" :help NERD_tree.txt

"  Open in all tabs / close in all tabs. Do this via :NERDTreeTabsToggle

nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1

let NERDTreeIgnore=['\.o$', '\~$']

" vim-nerdtree-tabs settings
let g:nerdtree_tabs_open_on_gui_startup = 0
