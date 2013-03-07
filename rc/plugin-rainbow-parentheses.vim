" https://github.com/kien/rainbow_parentheses.vim
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

"if exists(":RainbowParenthesesToggle")
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
"endif
