set nocompatible	" vi互換の排除
set re=1 " syntax highlightが重くならないための設定
" 検索 {{{
set incsearch
set hlsearch
" }}}
" ファイル処理  {{{
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin,iso-8851
set fileencoding=utf-8
" set backupdir=$HOME/.vim/backup
set nobackup
set directory=$HOME/.vim/swp
set tags=tags;
" }}}
" 操作性  {{{
set notimeout
set ttimeout
set timeoutlen=100
set vb t_vb=
set backspace=indent,eol,start
set ignorecase
imap <F1> <Esc>
map <F1> <Esc>
"}}}
" Scripts for NeoBundle  {{{
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" My NeoBundles here: {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'sudo.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'osyo-manga/vim-stargate'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
"NeoBundle '2GMon/mikutter_mode.vim'
NeoBundle 'zwpp/mikutter_mode.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'dart-lang/dart-vim-plugin'
NeoBundle 'shiracamus/vim-syntax-x86-objdump-d'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/vimproc.vim', {'build' : { 'linux' : 'make' } }
NeoBundle 'surround.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'emonkak/vim-operator-comment'
NeoBundle 'ngmy/vim-rubocop'

" }}}
" You can specify revision/branch/tag.
" NeoBundle Shougo/vimshell, { rev : 3787e5 }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" End NeoBundle Scripts-------------------------
" }}}
" 画面表示 {{{
syntax on	" 色分け
set number	" 行番号
set shiftwidth=4
set tabstop=4
" colorscheme railscasts
colorscheme molokai
set list
let &listchars="tab:\u21e5 ,trail:\u02fd,eol:\u21b2,extends:»,precedes:«,nbsp:%"
set cursorline
set cursorcolumn
set ambiwidth=double
set showcmd
set laststatus=2
" }}}
let $DOTVIM = $HOME . '/.vim'
set path+=.,/usr/include/c++/4.6,/usr/include/c++/4.6/x86_64-linux-gnu,/usr/include/c++/4.6/backward,/usr/local/include,/usr/include/x86_64-linux-gnu,/usr/include,/usr/include/clang/3.0/include/,/usr/lib/gcc/x86_64-linux-gnu/4.6/include/,/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/
set path+=/usr/include/qt4/QtCore,/usr/include/qt4/QtGui,/usr/include/qt4
set path+=/home/zw/ETrobo/ev3rt/hrp2/workspace/common/lib/libcpp-ev3/include,/home/zw/ETrobo/ev3rt/hrp2/target/ev3_gcc/api/include
" NeoComplete{{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
let g:neocomplete#keyword_patterns.c = '\h\w*\|#\w*'
let g:neocomplete#auto_completion_start_length = 2
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" Plugin keymap"{{{
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>""}}}

" Define dictionary."{{{
let g:neocomplete#sources#dictionary#dictionaries = {
\		'default' : '',
\		'c' : $DOTVIM.'/dict/c.dict',
\		'ruby' : $DOTVIM.'/dict/ruby.dict',
\	}"}}}

autocmd FileType c set dictionary='~/.vim/dict/c.dict'
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType whitespace set nolist
autocmd FileType whitespace set nocursorline
autocmd FileType whitespace set nocursorcolumn
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" }}}
" NeoSnippet{{{
" Plugin key-mappings."{{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"}}}

" SuperTab like snippets behavior.{{{
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
"}}}
" For snippet_complete marker."{{{
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}
let s:my_snippet = '~/.vim/mysnippet/'
let g:neosnippet#snippets_directory = s:my_snippet
"}}}
" Quickrun{{{
let g:quickrun_config = {
\   '*': {'runmode': 'async:remote:vimproc'},
\ }
let g:quickrun_config.cpp = {
\   'cmdopt': '-std=c++11'
\ }
"}}}
"lightline{{{
let g:lightline = {
\			'separator': { 'left': "\u2b80", 'right': "\u2b82" },
\			'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
\}
"}}}
" incsearch{{{
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"}}}
" vim-marching"{{{
NeoBundleLazy 'osyo-manga/vim-marching', {
\			  'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
\			  'autoload' : {'filetypes' : ['c', 'cpp']}
\			  }
" use with NeoComplete
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
\		'[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"}}}
" Vinarise{{{
let g:vinarise_enable_auto_detect = 1
"}}}
" vim:set ts=4 sw=4 ft=vim fenc=utf-8 foldmethod=marker :
