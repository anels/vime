" NERD_commenter
" https://github.com/scrooloose/nerdcommenter
" :help NERD_commenter.txt


let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
let NERDShutUp=1

" Map \<Space> to commenting
function! IsWhiteLine()
    if (getline(".")=~"^$")
        let oldlinenumber=line(".")
        :call NERDComment('n', 'Sexy')
        if (line(".")==oldlinenumber)
            :call NERDComment('n', 'Append')
        else
            normal! k
            startinsert!
        endif
    else
        normal! A 
        :call NERDComment('n', 'Append')
    endif
endfunction
nnoremap <silent>\<Space> :call IsWhiteLine()<CR>
