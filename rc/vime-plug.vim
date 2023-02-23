call plug#begin()

" {{{ Colorschemes
    Plug 'jdevera/vim-cs-explorer'
    "nnoremap <Leader>ec :ColorSchemeExplorer<CR>

    " 256-color
    Plug 'gmarik/ingretu'
    Plug 'Lokaltog/vim-distinguished'

    " gvim-dark
    Plug 'tomasr/molokai'

    " gvim-light
    Plug 'altercation/vim-colors-solarized'
    Plug 'w0ng/vim-hybrid'

    " gvim
    "Plug 'chriskempson/vim-tomorrow-theme'
" }}}

" {{{ UI Related

    Plug 'mhinz/vim-startify'

    Plug 'nathanaelkane/vim-indent-guides'
    " {{{ vim-indent-guides
        let g:indent_guides_enable_on_vim_startup=0
        let g:indent_guides_guide_size=2
        let g:indent_guides_auto_colors = 0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=3
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=4
        nnoremap <Leader>ig :IndentGuidesToggle<CR>
    " }}}

    Plug 'ryanoasis/vim-devicons'

    Plug 'kien/rainbow_parentheses.vim'
    " {{{ rainbow_parentheses
        let g:rbpt_max = 16
        let g:rbpt_loadcmd_toggle = 0
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    " }}}

    Plug 'vim-airline/vim-airline'
    " {{{ vim-airline
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        "let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline#extensions#tabline#formatter = 'unique_tail'
    " }}}

    Plug 'vim-airline/vim-airline-themes'
    " {{{ vim-airline-theme
        let g:airline_theme='bubblegum'
    " }}}

    Plug 'mbbill/undotree'
    "{{{ undotree
        nnoremap <Leader>u :UndotreeToggle<CR>
        if has("persistent_undo")
            set undodir=~/.undodir/
            set undofile
        endif
    "}}}
" }}}

" {{{ Auto Complete and Snippets
    Plug 'Shougo/neocomplcache'
    " {{{
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " Enable heavy features.
        " Use camel case completion.
        "let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        "let g:neocomplcache_enable_underbar_completion = 1

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()
        " Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

        " For cursor moving in insert mode(Not recommended)
        "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
        "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
        "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
        "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
        " Or set this.
        "let g:neocomplcache_enable_cursor_hold_i = 1
        " Or set this.
        "let g:neocomplcache_enable_insert_char_pre = 1

        " AutoComplPop like behavior.
        "let g:neocomplcache_enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplcache_enable_auto_select = 1
        "let g:neocomplcache_disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
        endif
        let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    " }}}

    " Plug 'SirVer/ultisnips'
    "Plug 'honza/vim-snippets'
    "Plug 'ervandew/supertab'
" }}}

" {{{ Automatic Helper
    Plug 'scrooloose/syntastic'
    " {{{ syntastic
        nnoremap <Leader>se :Errors<CR>
        let g:syntastic_check_on_open=1
        " let g:syntastic_auto_jump=1
        let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
        let g:syntastic_cpp_compiler_options = ' -std=c++0x'
    " }}}

    " Plugin 'Raimondi/delimitMate'
    " Plugin 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    " {{{
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " }}}

    Plug 'scrooloose/nerdcommenter'
" }}}

" {{{ Navigation
    Plug 'scrooloose/nerdtree'
    "{{{ nerdtree
        nnoremap <leader>w :NERDTree<CR>
        nnoremap <Leader>d :NERDTreeTabsToggle<CR>
        nnoremap <Leader>f :NERDTreeFind<CR>
        let NERDTreeChDirMode=2
        let NERDTreeShowBookmarks=1
        let NERDTreeShowHidden=1
        let NERDTreeShowLineNumbers=1
        let NERDTreeDirArrows=1
        let NERDTreeIgnore=['\.o$', '\~$']
    "}}}

    Plug 'jistr/vim-nerdtree-tabs'
    " {{{ vim-nerdtree-tabs
        let g:nerdtree_tabs_open_on_gui_startup = 0
    " }}}

    Plug 'dense-analysis/ale'
    Plug 'tweekmonster/braceless.vim'

    " Plugin 'xuhdev/SingleCompile'
    "if executable('git')
    Plug 'tpope/vim-fugitive'
    " nnoremap <silent> <leader>gs :Gstatus<CR>
    " nnoremap <silent> <leader>gd :Gdiff<CR>
    " nnoremap <silent> <leader>gc :Gcommit<CR>
    " nnoremap <silent> <leader>gb :Gblame<CR>
    " nnoremap <silent> <leader>gl :Glog<CR>
    " nnoremap <silent> <leader>gp :Git push<CR>
    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_terminal_reports_focus=0
    "endif

    " {{{ vim-autoformat (require python)
        "Plug 'Chiel92/vim-autoformat'
        "let g:autoformat_autoindent = 0
        "let g:autoformat_remove_trailing_spaces = 0
        "let g:autoformat_retab = 0
        "let g:autoformat_verbosemode=1
        "let g:formatter_yapf_style = 'google'
        "let g:formatterpath = ['$HOME\scoop\apps\astyle\current\bin']
        "noremap <F6> :Autoformat<CR> "require plugin 'Chiel92/vim-autoformat'
    " }}}

    "Plug 'plasticboy/vim-markdown'
    Plug 'szw/vim-maximizer'
    nnoremap <silent><F3> :MaximizerToggle<CR>
    vnoremap <silent><F3> :MaximizerToggle<CR>
    inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

    "if executable('ctags')
        Plug 'majutsushi/tagbar'
        nnoremap <F10> :TagbarToggle<CR>
        let g:tagbar_autofocus=1
        let g:tagbar_expand=1
        let g:tagbar_foldlevel=2
        let g:tagbar_ironchars=['▾', '▸']
        let g:tagbar_autoshowtag=1
    "endif

" }}}

" {{{ vim-grammarous
    "Plug 'rhysd/vim-grammarous'
    "let g:grammarous#languagetool_cmd = 'languagetool'
    " usage: ':[range]GrammarousCheck [--lang={lang}] [--(no-)preview] [--(no-)comments-only]'
" }}}

call plug#end()
