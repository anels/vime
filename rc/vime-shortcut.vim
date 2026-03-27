" vim: fdm=marker:

" ==================================================================
" KEY MAPPINGS {{{1
" ==================================================================

" ==================================================================
" Navigation and Movement {{{2
" ==================================================================
" Make j and k work with wrapped lines
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Beginning and end of line (more intuitive)
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

" Keep cursor position when joining lines
nnoremap J mzJ`z
" Join lines and remove extra space
noremap K Jx

" Select just pasted text
nnoremap gV `[v`]

" Space to toggle folds
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Same when jumping in jumplist
nnoremap g; g;zz
nnoremap g, g,zz

" Use Tab instead of % for bracket matching
nnoremap <Tab> %
vnoremap <Tab> %

" ==================================================================
" Editing and Text Manipulation {{{2
" ==================================================================
" Select all text
nnoremap <c-a> ggvG$
" vnoremap <c-a> ggvG$

" Quick escape from insert mode
inoremap jk <esc>

" Keep visual block highlighted when indenting
vnoremap >> >gv
vnoremap << <gv

" Repeat last substitution, including flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Strip all trailing whitespace in current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" Save, clean up buffer, clear highlight
map <F4> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>

" Expand region plugin mappings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ==================================================================
" Search and Text Objects {{{2
" ==================================================================
" Clear search highlight
nnoremap <leader><space> :noh<CR>

" Visual search - search for currently selected text
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

" Next text object (useful for jumping to next/prev delimiters)
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

" Last text object (for previous delimiters)
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

" ==================================================================
" Leader Key Mappings {{{2
" ==================================================================
" Set leader key
let mapleader= ',' " Change the mapleader

" ==================================================================
" File and Buffer Operations {{{3
" ==================================================================
" Quick access to Vim configuration files
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>ee :tabedit $VIMEDIR/vimrc<CR>
nnoremap <Leader>ep :tabedit $VIMEDIR/rc/vime-plug.vim<CR>
nnoremap <Leader>eg :tabedit $VIMEDIR/rc/vime-general.vim<CR>
nnoremap <Leader>es :tabedit $VIMEDIR/rc/vime-shortcut.vim<CR>
nnoremap <Leader>ef :tabedit $VIMEDIR/rc/vime-function.vim<CR>
nnoremap <Leader>ea :edit $VIMEDIR/rc/.<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Run make silently, redraw screen, open quickfix if errors
nnoremap <leader>m :silent make\|redraw!\|cw<CR>

" Quick save and syntax checking
" vnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>

" Yank to system clipboard
vnoremap <leader>y "+y

" Quick exit (save and quit)
nmap Q :x<cr>

" ==================================================================
" Tab Management {{{2
" ==================================================================
" Chrome-like tab operations
nmap <C-t>      :tabnew<cr>
"nmap <C-p>      :tabprevious<cr>
"nmap <C-n>     :tabnext<cr>
nmap <C-w>      :tabclose<cr>
nmap <C-Tab>    :tabnext<cr>
nmap <C-S-Tab>  :tabprevious<cr>

" ==================================================================
" Window Management (Commented for Reference) {{{3
" ==================================================================
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

" ==================================================================
" Commands {{{2
" ==================================================================
" See differences between current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis
" }}}
