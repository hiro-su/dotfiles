gui

"����(�d�������~)
"set transparency=235
"
"�J���[�X�L�[�}(������)��ݒ�
colorscheme leo

"�E�B���h�E���ő剻���ċN��
"au GUIEnter * simalt ~x

set cursorline
"highlight cursorline cterm=inverse
"highlight cursorline ctermbg=grey
"highlight cursorline ctermfg=blue

set cursorcolumn
"highlight cursorcolumn ctermbg=#707070
"highlight cursorcolumn ctermfg=blue

"tab�⊮�֘A s�Ŗ���, p�ŗL��
inoremap ,s <ESC>:AutoComplPopDisable<CR>a
inoremap ,q <ESC>:AutoComplPopEnable<CR>a
nnoremap ,s :AutoComplPopDisable<CR>
nnoremap ,q :AutoComplPopEnable<CR>

"�܂�Ԃ��s�֘A
nnoremap j gj
nnoremap k gk

"tab set
set showtabline=2

"�V�F���X�N���v�g�p�̃��j���[�\��
"http://nanasi.jp/articles/vim/shellmenu_vim.html

"ViewOutput �o�b�t�@�Ɏ��s���ʂ�\�� :VO version 
source $VIMRUNTIME/macros/shellmenu.vim
