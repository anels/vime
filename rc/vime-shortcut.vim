" =============================================================
" Key Mapping
" =============================================================

" Line Shortcuts {{{
" Make j and k work the way you expect
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
" 合并两行并删除一个字符
noremap K Jx
" Keep the cursorin place while joining lines
nnoremap J mzJ`z

nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
" select all text = ggVG$
nnoremap gV `[v`]
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
" }}}

" Leader Shortcuts {{{
let mapleader= ',' " Change the mapleader

nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader><space> :noh<CR>
vnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
vnoremap <leader>y "+y

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>

" Fast vime file access
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>ee :tabedit $VIMEDIR/vimrc<CR>
nnoremap <Leader>ep :tabedit $VIMEDIR/rc/vime-plug.vim<CR>
nnoremap <Leader>eg :tabedit $VIMEDIR/rc/vime-general.vim<CR>
nnoremap <Leader>es :tabedit $VIMEDIR/rc/vime-shortcut.vim<CR>
nnoremap <Leader>ef :tabedit $VIMEDIR/rc/vime-function.vim<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" List all configuration files
nnoremap <Leader>ea :edit $VIMEDIR/rc/.<CR>

" Chrome-Like Tab short-keys
nmap <C-t>      :tabnew<cr>
"nmap <C-p>      :tabprevious<cr>
"nmap <C-n>     :tabnext<cr>
nmap <C-w>      :tabclose<cr>
nmap <C-Tab>    :tabnext<cr>
nmap <C-S-Tab>  :tabprevious<cr>

"nmap <Leader>w :wincmd
"nmap <Leader>ww :wincmd w<CR>
"nmap <Leader>wc :wincmd c<CR>
"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>
"nmap <silent> <A-=> :wincmd +<CR>
"nmap <silent> <A--> :wincmd -<CR>
"nmap <silent> <A-.> > :wincmd ><CR>
"nmap <silent> <A-,> < :wincmd <<CR>
" }}}

" Space to toggle and create folds.
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" 选中一段文字并全文搜索这段文字
"vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

" Quit current window by pressing Q
nmap Q :x<cr>

" Use spacebar toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 保存、处理行尾空格和多余空格，并清除高亮
" map <f3> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
" nmap b :<C-U>call BufPos_ActivateBuffer(v:count)<CR>

map <F4> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>


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

" vim:foldmethod=marker:foldlevel=0
