" =============================================================
" Functions
" =============================================================

function! LastModified() " {{{
    exe "1,20 s/[L]ast Modified: .*/Last Modified: " .
                \ strftime("%Y-%m-%d %X") . "/e"
endfunction " }}}

" Select All Text
func! SelectAll()
    let s:current = line('.')
    exe "norm gg" . (&slm == "" ? "VG" : "gH\<C-O>G")
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
