" =============================================================
" Plug-in: Vim-LaTeX Suite
" =============================================================
" Homepage > http://vim-latex.sourceforge.net
" Document > :help latex-suite
" =============================================================
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
if has('win32')
  set shellslash
endif

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" Sets grep flags to include the filename
set grepprg=grep\ -nH\ $*



" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!


" Set inital window width
set columns=85

set wm=6

set fo+=t
set fo-=l  "auto format

" Latex specific settings
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

" We use Latex and not Tex
let g:tex_flavor='latex'

" pdf viewer
let g:Tex_ViewRule_pdf = 'evince'
" let g:Tex_ViewRule_dvi = 'evince'

" by default create pdf
let g:Tex_DefaultTargetFormat = 'pdf'

" perform several runs. for bibtex, references etc.
let g:Tex_MultipleCompileFormats = 'pdf,dvi'
