"==========================================
" vim-plug 
"==========================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

"==========================================
" 设置颜色
"==========================================
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
syntax on
colorscheme onedark


"==========================================
" set设置 
"==========================================
set clipboard=unnamed
set encoding=utf-8
set number        " 显示行号
set ruler         " 显示当前的行号列号
set laststatus=2  " 命令行（在状态行下）的高度，默认为1，这里是2
set noshowmode    " 不显示命令
set cursorline    " 突出显示当前行
set mouse-=a      " 鼠标暂不启用
set scrolloff=10  " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set showmatch     " 括号配对情况, 跳转并高亮一下匹配的括号
set matchtime=2   " 匹配括号时候，闪烁时间 
set incsearch     " 打开增量搜索模式,随着键入即时搜索
set ignorecase    " 搜索时忽略大小写
set smartcase     " 有一个或以上大写字母时仍大小写敏感
set smartindent   " 缩进
set autoindent
set shiftwidth=4  " 每一次缩进对应的空格数
set tabstop=4     " 设置tab缩进
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " 在行首输入 tab 时插入宽度为 shiftwidth 的空白
set expandtab     " 将Tab自动转化成空格,保存的时候[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整
set history=1000  " vim需要记住的历史操作
set completeopt=longest,menu  " 让Vim的补全菜单行为与一般IDE一致
set backspace=indent,eol,start

"==========================================
" let设置 
"==========================================
let mapleader = "\<Space>"       " 前缀键
let g:lightline = {'colorscheme': 'wombat',}
" Multip Cursor
" Default key mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


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
map <F2> :call SetTitle()<CR>
" normal 模式快捷键
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
" insert 模式快捷键
inoremap jk <Esc>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap {<CR> {<CR>}<ESC>O

func SetTitle()
    let l = 0
    let l = l + 1 | call setline(l,'/* ***********************************************')
    let l = l + 1 | call setline(l,'Author        :liyansong')
    let l = l + 1 | call setline(l,'Created Time  :'.strftime('%c'))
    let l = l + 1 | call setline(l,'File Name     :'.expand('%'))
    let l = l + 1 | call setline(l,'************************************************ */')
    let l = l + 1 | call setline(l,'')
    let l = l + 1 | call setline(l,'#include <iostream>')
    let l = l + 1 | call setline(l,'#include <cstdio>')
    let l = l + 1 | call setline(l,'#include <string>')
    let l = l + 1 | call setline(l,'#include <cstring>')
    let l = l + 1 | call setline(l,'#include <math>')
    let l = l + 1 | call setline(l,'#include <algorithm>')
    let l = l + 1 | call setline(l,'#include <vector>')
    let l = l + 1 | call setline(l,'')
    let l = l + 1 | call setline(l,'using namespace std;')
    let l = l + 1 | call setline(l,'')
    let l = l + 1 | call setline(l,'int main() {')
    let l = l + 1 | call setline(l,'    return 0;')
    let l = l + 1 | call setline(l,'}')
endfunc

