" =============================================================
" Functions
" =============================================================

function! LastModified() " {{{
    exe "1,20 s/[L]ast Modified: .*/Last Modified: " .
                \ strftime("%Y-%m-%d %X") . "/e"
endfunction " }}}

function! InitializeDirectories() " {{{
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory'}
    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif
    for [dirname, settingname] in items(dir_list)
        let directory=$VIMFILES.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                call mkdir(directory)
                exec 'set '.settingname.'='.directory
            else
                echo "Warning: Unable to create directory: ".directory
                echo "Try: mkdir -p ".directory
            endif
        else
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction "}}}

function! RemoveOldViewFiles ()
    exec '!find '.$VIMFILES.'/view/* -mtime +30 -exec rm {} \;'
endfunction
nmap <silent><leader>rvo :call RemoveOldViewFiles()<cr>

function! RemoveAllViewFiles ()
    exec '!find '.$VIMFILES.'/view/* -exec rm {} \;'
endfunction
nmap <silent><leader>rvv :call RemoveAllViewFiles()<cr>

" Select All Text
func! SelectAll()
    let s:current = line('.')
    exe "norm gg" . (&slm == "" ? "VG" : "gH\<C-O>G")
endfunc

"Get short tab label (Only shows the filename)
func! GetShortTabLabel()
    let bufnrlist = tabpagebuflist(v:lnum)
    let label = bufname(bufnrlist[tabpagewinnr(v:lnum) -1])
    let filename = fnamemodify(label, ':t')
    return filename
endfunc

" func! VisualSearch(direction) range
" let l:saved_reg = @"
" execute "normal! vgvy"

" let l:pattern = escape(@", '\\/.*$^~[]')
" let l:pattern = substitute(l:pattern, "\n$", "", "")

" if a:direction == 'b'
" execute "normal ?" . l:pattern . "^M"
" elseif a:direction == 'gv'
" call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
" elseif a:direction == 'f'
" execute "normal /" . l:pattern . "^M"
" endif

" let @/ = l:pattern
" let @" = l:saved_reg
" endfunc


function! CleanupBuffer(keep)
    if (&bin > 0)
        return
    endif
    silent! %s/\s\+$//ge
    let lnum = line(".")
    let lastline = line("$")
    let n        = lastline
    while (1)
        let line = getline(n)
        if (!empty(line))
            break
        endif
        let n = n - 1
    endwhile
    let start = n+1+a:keep
    if (start < lastline)
        execute n+1+a:keep . "," . lastline . "d"
    endif
    exec "normal " . lnum . "G"
endfunction


" Visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction

" vim: fdm=marker:
