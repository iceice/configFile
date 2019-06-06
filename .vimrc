" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

" set color
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

syntax on
colorscheme onedark

set clipboard=unnamed
set encoding=utf-8
" 显示行号
set number
" 显示当前的行号列号
set ruler
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
" 命令行（在状态行下）的高度，默认为1，这里是2
set laststatus=2
" 不显示命令
set noshowmode
" 不显示文件信息
set shortmess+=F
" 突出显示当前行
"set cursorline
" 鼠标暂不启用
set mouse-=a
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7
" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 缩进
set smartindent
set autoindent
" 每一次缩进对应的空格数
set shiftwidth=4
" 设置tab缩进
set tabstop=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround


"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================
" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" jk 替换 Esc
inoremap jk <Esc>


" set ycm default extra_conf
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_con = 0
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_key_invoke_completion = '<c-z>'
"let g:ycm_cache_omnifunc=0
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
