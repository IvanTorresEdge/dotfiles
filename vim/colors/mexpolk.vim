set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = "Mexpolk Dark" 

" Change color of dropdown window
hi Pmenu cterm=NONE ctermfg=black ctermbg=blue
hi PmenuSel cterm=bold ctermfg=black ctermbg=white

" Change highlighting colors
hi Visual cterm=reverse ctermbg=black ctermfg=none
hi SpellBad cterm=underline ctermfg=red ctermbg=none
hi Search cterm=reverse ctermfg=green ctermbg=black
hi CursorLine cterm=standout ctermfg=none ctermbg=none
