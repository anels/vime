
if has('gui_running')
  if has("mac") || has("gui_macvim")
    if has("gui_macvim")
      " 开启抗锯齿渲染
      set anti
      " MacVim 下的字体配置
      "set guifont=Courier_New:h14
      "set guifontwide=YouYuan:h14
      "set guifont=YaHei_Consolas_Hybrid:h13
      set guifont=Menlo:h14
      "set guifontwide=YaHei_Consolas_Hybrid:h12
      set guifontwide=Menlo:h14

      "set transparency=8
      set lines=222 columns=222

      " 使用 MacVim 原生的全屏幕功能
      let s:lines=&lines
      let s:columns=&columns
      func! FullScreenEnter()
        set lines=999 columns=999
        set fu
      endf

      func! FullScreenLeave()
        let &lines=s:lines
        let &columns=s:columns
        set nofu
      endf

      func! FullScreenToggle()
        if &fullscreen
          call FullScreenLeave()
        else
          call FullScreenEnter()
        endif
      endf
    endif
  endif
endif

  if has('gui_macvim')
    set guioptions+=e
  endif

" Under the Mac(MacVim)
if has("gui_macvim")
  " Mac 下，按 \ff 切换全屏
  map <Leader>ff  :call FullScreenToggle()<cr>

  " I like TCSH :^)
  set shell=/bin/tcsh

  " Set input method off
  set imdisable

  " Set QuickTemplatePath
  let g:QuickTemplatePath = $HOME.'/.vim/templates/'

  " 如果为空文件，则自动设置当前目录为桌面
  "lcd ~/Desktop/
endif
