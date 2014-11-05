syntax on	"色分け
set number	"行番号
set nocompatible	"vi互換の排除
set notimeout
set ttimeout
set timeoutlen=100
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp,utf-8,cp932,euc-jp,default,latin,iso-8851
set shiftwidth=4
set tabstop=4
colorscheme railscasts
set list
set listchars=tab:»\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nobackup
"set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swp
set tags=tags
autocmd FileType c :set dictionary='~/.vim/dict/c.dict'
set vb t_vb=
set backspace=indent,eol,start
set cursorline
"set cursorcolumn
set ambiwidth=double

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/zw/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My NeoBundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'sudo.vim'
" You can specify revision/branch/tag.
" NeoBundle Shougo/vimshell, { rev : 3787e5 }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"NeoComplete.Config----------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let $DOTVIM = $HOME . '/.vim'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'c' : $DOTVIM.'/dict/c.dict',
    \ 'ruby' : $DOTVIM.'/dict/ruby.dict',
    \ }

"NeoSnippet.Config----------------------------
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let s:my_snippet = '~/.vim/mysnippet/'
let g:neosnippet#snippets_directory = s:my_snippet
"StargateInclude.Config---------------------------
NeoBundle 'osyo-manga/vim-stargate'
let g:stargate#include_paths = {
\		"c":[
\			"/home/zw/ETrobo/nxtOSEK/ecrobot/c"
\		]
\}
"Unite.config-------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

"mikutter_mode------------------------------------
NeoBundle '2GMon/mikutter_mode.vim'

"Quickrun-----------------------------------------
NeoBundle 'thinca/vim-quickrun'
