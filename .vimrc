"==========================================
" vim-plug 
"==========================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/space-vim-theme'  " 主题
Plug 'itchyny/lightline.vim'       " 状态栏
Plug 'Yggdroot/indentLine'         " 缩进线
Plug 'Raimondi/delimitMate'        " 括号匹配
Plug 'terryma/vim-multiple-cursors'    " 多选操作
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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
set background=dark
colorscheme space_vim_theme
hi Comment cterm=italic
hi Comment guifg=#5C6370 ctermfg=59
" == Fix the italic bug ==
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"==========================================
" set设置 
"==========================================
set encoding=utf-8
set number        " 显示行号
set ruler         " 显示当前的行号列号
set laststatus=2  " 命令行（在状态行下）的高度，默认为1，这里是2
set noshowmode    " 不显示命令
set cursorline    " 突出显示当前行
set mouse=a       " 启动鼠标
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
set clipboard=unnamed " 开启剪贴板功能
set ttimeoutlen=0     " 设置<ESC>键响应时间
set completeopt=longest,menu  " 让Vim的补全菜单行为与一般IDE一致
set backspace=indent,eol,start


"==========================================
" let设置 
"==========================================
let mapleader = "\<Space>"       " 前缀键
" Multip Cursor
" Default key mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" indentLine
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
" expand <CR> when you press enter.
let delimitMate_expand_cr = 1
" lightline theme.
let g:lightline = { 'colorscheme': 'wombat' }

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================
" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-b> :NERDTreeToggle<CR>
" normal 模式快捷键
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" insert 模式快捷键
inoremap jk <Esc>

map <F1> :call SetTitle()<CR>
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
    let l = l + 1 | call setline(l,'#include <algorithm>')
    let l = l + 1 | call setline(l,'#include <vector>')
    let l = l + 1 | call setline(l,'')
    let l = l + 1 | call setline(l,'using namespace std;')
    let l = l + 1 | call setline(l,'')
    let l = l + 1 | call setline(l,'int main() {')
    call cursor(l, 0)
    let l = l + 1 | call setline(l,'    return 0;')
    let l = l + 1 | call setline(l,'}')
endfunc

map <F2> :call SaveInputData()<CR>
func SaveInputData()
    exec "tabnew"
    exec "w! /tmp/input_data"
endfunc

map <F5> :call Run()<CR>
func Run()
    exec "w"
    exec "!g++ -Wall % -o /tmp/%<"
    exec "!/tmp/%< < /tmp/input_data"
endfunc


