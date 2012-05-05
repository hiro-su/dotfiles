gui

"透過(重いから停止)
"set transparency=235
"
"カラースキーマ(見た目)を設定
colorscheme leo

"ウィンドウを最大化して起動
"au GUIEnter * simalt ~x

set cursorline
"highlight cursorline cterm=inverse
"highlight cursorline ctermbg=grey
"highlight cursorline ctermfg=blue

set cursorcolumn
"highlight cursorcolumn ctermbg=#707070
"highlight cursorcolumn ctermfg=blue

"tab補完関連 sで無効, pで有効
inoremap ,s <ESC>:AutoComplPopDisable<CR>a
inoremap ,q <ESC>:AutoComplPopEnable<CR>a
nnoremap ,s :AutoComplPopDisable<CR>
nnoremap ,q :AutoComplPopEnable<CR>

"折り返し行関連
nnoremap j gj
nnoremap k gk

"tab set
set showtabline=2

"シェルスクリプト用のメニュー表示
"http://nanasi.jp/articles/vim/shellmenu_vim.html

"ViewOutput バッファに実行結果を表示 :VO version 
source $VIMRUNTIME/macros/shellmenu.vim
