" =============================================================
" Functions
" =============================================================

" vim: fdm=marker:

" ==================================================================
" UTILITY FUNCTIONS {{{1
" ==================================================================

" ==================================================================
" File Manipulation Functions {{{2
" ==================================================================

" LastModified: Updates the 'Last Modified' timestamp in file header
function! LastModified() " {{{
    exe "1,20 s/[L]ast Modified: .*/Last Modified: " .
                \ strftime("%Y-%m-%d %X") . "/e"
endfunction " }}}

" CleanupBuffer: Removes trailing whitespace and excess blank lines
" @param keep: Number of empty lines to keep at end of file
function! CleanupBuffer(keep) " {{{
    " Skip binary files
    if (&bin > 0)
        return
    endif

    " Remove trailing whitespace
    silent! %s/\s\+$//ge

    " Remember cursor position
    let lnum = line(".")
    let lastline = line("$")
    let n = lastline

    " Find last non-empty line
    while (1)
        let line = getline(n)
        if (!empty(line))
            break
        endif
        let n = n - 1
    endwhile

    " Remove excess blank lines at end of file
    let start = n+1+a:keep
    if (start < lastline)
        execute n+1+a:keep . "," . lastline . "d"
    endif

    " Restore cursor position
    exec "normal " . lnum . "G"
endfunction " }}}

" ==================================================================
" Selection and Navigation Functions {{{2
" ==================================================================

" SelectAll: Select all text in current buffer
function! SelectAll() " {{{
    let s:current = line('.')
    exe "norm gg" . (&slm == "" ? "VG" : "gH\<C-O>G")
endfunction " }}}

" ==================================================================
" Search Functions {{{2
" ==================================================================

" VSetSearch: Set search pattern to current visual selection
" Use with visual mode mappings to search for selected text
function! s:VSetSearch() " {{{
    let temp = @@
    normal! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction " }}}

" ==================================================================
" EXAMPLE MAPPINGS {{{1
" ==================================================================
" To use the functions above, add mappings like these to your vimrc:
"
" " Clean trailing whitespace and save
" nnoremap <leader>w :call CleanupBuffer(1)<CR>:w<CR>
"
" " Select all text
" nnoremap <leader>a :call SelectAll()<CR>
"
" " Search for visual selection
" xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>
" xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<CR>
" }}}
