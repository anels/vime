" VimWiki 
if !exists("g:vimwiki_list")
  "    let g:vimwiki_list = [
  "                \{"path": "~/Wiki/Default/", "path_html": "~/Sites/wiki/",
  "                \   "html_footer": "~/Wiki/Default/footer.tpl", 
  "                \   "html_header": "~/Wiki/Default/header.tpl",
  "                \   "auto_export": 1},
  "                \{"path": "~/Wiki/Blog/",
  "                \   "path_html": "~/Sites/blog/", 
  "                \   "html_footer": "~/Wiki/Blog/footer.tpl", 
  "                \   "html_header": "~/Wiki/Blog/header.tpl",
  "                \   "auto_export": 1}
  "                \]

  let s:vimwiki_root = "$HOME/Dropbox/vimwiki"
  let g:vimwiki_list = [
        \{'path': s:vimwiki_root.'/vimwiki_private',
        \ 'diary_link_count': 5},
        \{'path': s:vimwiki_root.'/vimwiki_public',
        \ 'path_html': '$HOME/Dropbox/Public/vimwiki',
        \ 'html_header': s:vimwiki_root.'/vimwiki_template/header.tpl',
        \ 'html_footer': s:vimwiki_root.'/vimwiki_template/footer.tpl',
        \ 'css_name': 'css/style.css'}
        \]

  let wiki = {}
  let wiki.auto_export=1 "保存时是否自动生成html
  " let g:vimwiki_folding = 1 " 是否开启按语法折叠  会让文件比较慢
  let wiki.vimwiki_CJK_length=1 " 是否在计算字串长度时用特别考虑中文字符
  let g:vimwiki_hl_cb_checked = 1 " 标记为完成的 checklist 项目会有特别的颜色
  let g:vimwiki_camel_case = 0 " 取消驼峰命名
  let g:vimwiki_auto_checkbox = 0
  let g:vimwiki_use_mouse = 1
  " let g:vimwiki_menu = '' " 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
  let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

  au FileType vimwiki set ff=unix fenc=utf8 noswapfile nobackup
  "au FileType vimwiki imap <C-t> <c-r>=TriggerSnippet()<cr>

  nmap <C-i><C-i> :VimwikiTabGoHome<cr>
  nmap <Leader>ii :VimwikiTabGoHome<cr>
endif
