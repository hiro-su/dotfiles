"===== windows install ==========
"mklink _vimrc dotfiles\.vimrc
"mklink _gvimrc dotfiles\.gvimrc
"mklink /D vimfiles dotfiles\.vim
"================================

"" プラグインを使うようにする
filetype plugin on
"" おまじない
"set shellslash
filetype indent on

"ファイルエンコード指定
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

"行番号表示
set number

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
	autocmd!
	autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
	autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

"C-c,C-v,C-x,有効化
"source $VIMRUNTIME/mswin.vim"

set sm
set ai
syntax on
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup

set cursorline
highlight cursorline cterm=inverse
highlight cursorline ctermbg=blue
highlight cursorline ctermfg=white
set cursorcolumn
highlight cursorcolumn ctermbg=blue
highlight cursorcolumn ctermfg=white

"CSVハイライト
function! CSVH(x)
	execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
	execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

"PHP文法チェック
":makeまたは,l
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l

nmap ,l :call PHPLint()
function PHPLint()
	let result = system( &ft . ' -l ' . bufname(""))
	echo result
endfunction

"PHPハイライト設定
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1

"ハイライトをEsc2回で消す
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"zencoding
"Ctrl+Enter , に変更
let g:user_zen_leader_key = '<c-Enter>'
let g:user_zen_settings = {'lang':'ja'}

"omnifunc
setlocal omnifunc=syntaxcomplete#Complete

"vundle
filetype off
if has('win32') || has('win64')
    let $DOTVIM = expand('~/vimfiles')
else
    let $DOTVIM = expand('~/.vim')
endif
set rtp+=$DOTVIM/bundle/vundle
call vundle#rc('$DOTVIM/bundle')
Bundle 'gmarik/vundle'
Bundle 'thinca/vim-quickrun'
Bundle 'ZenCoding.vim'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/unite.vim'
filetype plugin indent on

"=============================================================================
" neocomplcache

"=============================================================================
" neocomplcacheの設定について知る　前編　http://vim-users.jp/2010/11/hack185/
"=============================================================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

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

"=============================================================================
" neocomplcacheの設定について知る　中編　http://vim-users.jp/2010/11/hack185/
"=============================================================================
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"=============================================================================
" neocomplcacheの設定について知る　後編　http://vim-users.jp/2011/01/hack193/
"=============================================================================
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"rubycomplete.vim
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"=============================================================================

"zencoding連携
let g:use_zen_complete_tag = 1
"=============================================================================
