
if has('gui_running')
  if has("mac") || has("gui_macvim")
    if has("gui_macvim")
      " 开启抗锯齿渲染
      set anti
      set guioptions+=e

      "set transparency=8
      set lines=222 columns=222

      " 使用 MacVim 原生的全屏幕功能
      let s:lines=&lines
      let s:columns=&columns

    endif
  endif
endif
