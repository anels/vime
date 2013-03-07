"--------------------------------------------------
" EasyTags
" https://github.com/xolox/vim-easytags
" :help easytags
"--------------------------------------------------

function! InitializeTagDirectory()
  let parent=$HOME
  let prefix='.vim'
  let dirname='tags'
  let directory=parent.'/'.prefix.'/'.dirname.'/'
  if !isdirectory(directory)
    if exists('*mkdir')
      call mkdir(directory)
      let g:easytags_by_filetype=directory
    else
      echo "Warning: Unable to create directory: ".directory
      echo "Try: mkdir -p ".directory
    endif
  else
    let g:easytags_by_filetype=directory
  endif
endfunction
call InitializeTagDirectory()
let g:easytags_python_enabled=1
let g:easytags_python_script=1
let g:easytags_include_members=1
highlight cMember gui=italic
