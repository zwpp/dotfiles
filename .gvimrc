set ambiwidth=double
set lines=40
set columns=120
let &guifont = "Ricty Discord for Powerline Regular 13.5"
let &guifontwide = "Ricty Discord for Powerline Regular 13.5"
au BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
set visualbell t_vb=
"センタークリックペースト無効化
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>
"スクロールバー消し
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
"メニューバー消し
set guioptions-=m
"ツールバー消し
set guioptions-=T

