" vim: fdm=marker:

" =============================================================
" Key Mapping
" =============================================================
"let mapleader = ","
let g:mapleader = ","
let mapleader= ',' " Change the mapleader
let maplocalleader='\' " Change the maplocalleader

" Fast vime file access
" map <silent> <leader>ee :e $MYVIMRC<cr>
nnoremap <Leader>ee :tabedit $MYVIMRC<CR>
nnoremap <Leader>eb :tabedit $VIMFILES/rc/vime-bundle.vim<CR>
nnoremap <Leader>eg :tabedit $VIMFILES/rc/vime-general.vim<CR>
nnoremap <Leader>es :tabedit $VIMFILES/rc/vime-shortcut.vim<CR>
nnoremap <Leader>ef :tabedit $VIMFILES/rc/vime-function.vim<CR>

" List all configuration files
nnoremap <Leader>ea :tabnew $VIMFILES/rc/.<CR>

nnoremap <Leader>ec :ColorSchemeExplorer<CR>

map <silent> <leader>rc :source $MYVIMRC<cr>

" Chrome-Like Tab short-keys
nmap <C-t>      :tabnew<cr>
"nmap <C-p>      :tabprevious<cr>
"nmap <C-n>     :tabnext<cr>
nmap <C-w>      :tabclose<cr>
nmap <C-Tab>    :tabnext<cr>
nmap <C-S-Tab>  :tabprevious<cr>

nmap <Leader>w :wincmd
nmap <Leader>ww :wincmd w<CR>
nmap <Leader>wc :wincmd c<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-=> :wincmd +<CR>
nmap <silent> <A--> :wincmd -<CR>
nmap <silent> <A-.> > :wincmd ><CR>
nmap <silent> <A-,> < :wincmd <<CR>


" Space to toggle and create folds.
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

" Quit current window by pressing Q
nmap Q :x<cr>

" Use spacebar toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 选中一段文字并全文搜索这段文字
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" 保存、处理行尾空格和多余空格，并清除高亮
map <f3> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
nmap b :<C-U>call BufPos_ActivateBuffer(v:count)<CR>

noremap <F3> :Autoformat<CR><CR> " require plugin 'Chiel92/vim-autoformat'

map <F4> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 合并两行并删除一个字符
noremap K Jx
" Keep the cursorin place while joining lines
nnoremap J mzJ`z

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" keep visual block highlighted when indenting
vnoremap >> >gv
vnoremap << <gv

" Repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Use Tab insteadof % to switch among brackets/parenthesis
nnoremap <Tab> %
vnoremap <Tab> %

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" See the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis

