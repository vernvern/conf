" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" git clone https://github.com/jpalardy/vim-slime.git ~/.vim/bundle/vim-slime




"********************************************************
"                   一般性配置                          *
"********************************************************

"-----------------------正常配置


"去掉vi的一致性
set nocompatible              " be iMproved, required

set laststatus=2
set cmdheight=2

" 区分大小
set noic
"设置搜索时忽略大小写
" set ignorecase

"显示行号
" set number

"设置在编辑过程中右下角显示光标的行列信息
set ruler

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile

"显示匹配括号
set showmatch

"文件编码
set fenc=utf-8

"设置编码方式
set encoding=utf-8

"自动判断编码时 依次尝试以下编码
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"设置自动缩进
" set autoindent
" set cindent

" paste 模式开关
set pastetoggle=<F3>

" "开启语法高亮功能
syntax enable
syntax on


"高亮搜索项
set hlsearch

"突出显示当前行 " mac下会卡。。。。
" set cursorline

"突出显示当前列
"set cursorcolumn

"指定配色方案为256色
set t_Co=256

"配置backspace的工作方式
set backspace=indent,eol,start

"设置在vim中可以使用鼠标
"set mouse=a

"设置tab宽度
set tabstop=4
au BufNewFile,BufRead *.dart set tabstop=2
au BufNewFile,BufRead *.yml set tabstop=2
au BufNewFile,BufRead *.js set tabstop=2

"设置自动对齐空格数
set shiftwidth=4
au BufNewFile,BufRead *.dart set shiftwidth=2
au BufNewFile,BufRead *.yml set shiftwidth=2
au BufNewFile,BufRead *.js set shiftwidth=2
set softtabstop=4
au BufNewFile,BufRead *.dart set softtabstop=2
au BufNewFile,BufRead *.yml set softtabstop=2
au BufNewFile,BufRead *.js set softtabstop=2

"设置退格键时可以删除4个空格
set smarttab
"将tab键自动转换为空格
set expandtab

"检测文件类型
filetype on

"针对不同的文件采取不同的缩进方式
filetype indent on

"允许插件
filetype plugin on

"启动智能补全
"filetype plugin indent on

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"leader映射为
let mapleader = "b"

set background=dark

set laststatus=2
let g:Powline_symbols='fancy'

"python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF



" Enable folding  代码折叠
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar   error
" nnoremap <space> za

" 标出多余空格
" autocmd BufNewFile,BufRead *.py exec ":call Highlight_py_space()"
autocmd BufNewFile,BufRead * exec ":call Highlight_py_space()"
func Highlight_py_space()
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
endfunc


"新建文件后自动定位至文件末尾
autocmd BufNewFile * normal G

"F2去空行
nnoremap <F2> :g/^\s*$/d<CR>

" 自动重载
" set autoread

" 将ejs格式视为html格式
au BufNewFile,BufRead *.ejs set filetype=html
" 将tag格式视为html格式
au BufNewFile,BufRead *.tag set filetype=html

"************************************************************
"                   python
"************************************************************
"
"根据文件类型自动插入文件头
autocmd BufNewFile *.py exec ":call SetTitle()"
autocmd BufNewFile *.py exec ":call SetTitle()"
func SetTitle()
call setline(1, "\# -*- coding=utf-8 -*-")
call append(line("."), "")
endfunc

" vimgrep输出到quickfix
map ft :call Search_Word()<CR>:copen<CR>
function Search_Word()
let w = expand("<cword>") " 在当前光标位置抓词
execute "vimgrep " . w . " *"
 endfunction


"************************************************************
"         vundle
"************************************************************
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"优雅的在vim里使用git
"Plugin 'tpope/vim-fugitive'

" 显示git的diff状态
Plugin 'airblade/vim-gitgutter'

"优雅的跳转～
Plugin 'Lokaltog/vim-easymotion'

"显示当前文件中的宏、全局变量、函数等
Plugin 'taglist.vim'

"树形的文件系统浏览器
Plugin 'The-NERD-tree'

"彩虹括号
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'luochen1990/rainbow'

"文件跳转兄弟俩
"Plugin 'FuzzyFinder'
"Plugin 'L9'

"很美观实用的状态栏
Plugin 'Lokaltog/vim-powerline'

"自动补全三剑客
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
" Plugin 'syntastic'                 "语法检查

"传递路径，合理设置运行时路径。
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"html
Plugin 'mattn/emmet-vim'

"关于缩进
Plugin 'tmhedberg/SimpylFold'

" 代码块辅助线
Plugin 'Yggdroot/indentLine'

" markdown 高亮
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" markdown 实时预览
" Plugin 'suan/vim-instant-markdown'

" 显示marks
Plugin 'kshenoy/vim-signature'

Plugin 'ctrlpvim/ctrlp.vim'

" 查找代码
Plugin 'mileszs/ack.vim'

" github 文档目录
Plugin 'mzlogin/vim-markdown-toc'

" dart
Plugin 'dart-lang/dart-vim-plugin'

" dash
Plugin 'rizzatti/dash.vim'

"Brief help of vundle
"    :BundleList -列举出列表中(.vimrc中)配置的所有插件
"    :BundleInstall -安装列表中全部插件
"    :BundleInstall! -更新列表中全部插件
"    :BundleSearch foo -查找foo插件
"    :BundleSearch! foo -刷新foo插件缓存
"    :BundleClean -清除列表中没有的插件
"    :BundleClean! -清除列表中没有的插件
"End brief vundle
call vundle#end()
filetype plugin indent on


"****************************************************************


"*****************************************************
"                   taglist配置                      *
"*****************************************************

"不显示"press F1 to display help"
let Tlist_Compact_Format=1

"窗口在右侧显示
let Tlist_Use_Right_Window=1

"只显示当前文件的tags
let Tlist_Show_One_File=1

"高亮显示
let Tlist_Auto_Highlight_tag=1

"随文件自动更新
let Tlist_Auto_Update=1

"设置宽度
let Tlist_WinWidth=30

"taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1

"单击跳转
let Tlist_Use_SingClick=1

"打开关闭快捷键
nnoremap <silent> <F8> :TlistToggle<CR>




"********************************************************
"                      NERD_Tree 配置                   *
"********************************************************

"显示增强
let NERDChristmasTree=1

"自动调整焦点
let NERDTreeAutoCenter=1

"鼠标模式:目录单击,文件双击
let NERDTreeMouseMode=2

"打开文件后自动关闭
let NERDTreeQuitOnOpen=1

"显示文件
let NERDTreeShowFiles=1

"显示隐藏文件
let NERDTreeShowHidden=1

"高亮显示当前文件或目录
let NERDTreeHightCursorline=1

"显示行号
"let NERDTreeShowLineNumbers=1

"窗口位置
let NERDTreeWinPos='left'

"窗口宽度
let NERDTreeWinSize=31

"不显示'Bookmarks' label 'Press ? for help'
let NERDTreeMinimalUI=1

"快捷键
nnoremap <silent> <F4> :NERDTreeToggle<CR>

"打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree

"忽略 *.pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


"*****************************************************
"           YouCompleteMe配置                        *
"*****************************************************

"使用python3编译
let g:ycm_path_to_python_interpreter="/usr/bin/python3"

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

"配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"按,jd 会跳转到定义
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 触发语义补全的正则
let g:ycm_semantic_triggers = {
    \ "c,cpp,python,java,go,erlang,perl": ['re!\w{2}'],
    \ "cs,lua,javascript,dart": ['re!\w{2}'],
    \ }

" 关闭函数原型预览
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0

" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1

" 补全框颜色
highlight PMenu ctermfg=0 ctermbg=73 guifg=black guibg=CadetBlue
highlight PMenuSel ctermfg=0 ctermbg=6 guifg=CadetBlue guibg=Teal

" 补全后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion=1

" 是否在注释中也开启补全
let g:ycm_complete_in_comments=1

" 字符串中也开启补全
let g:ycm_complete_in_strings = 1

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"*****************************************************
"          Syntastic配置    用于语法检查             *
"*****************************************************


let g:Syntastic_check_on_open=1

let g:syntastic_error_symbol='✗'

let g:syntastic_python_python_exe = 'python3'
"禁止syntatic 对python 的检查
let g:syntastic_ignore_files=[".*\.py$"]


"************************************************************
"         rainbow  彩虹括号                                 *
"************************************************************


let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"************************************************************
"         Lokaltog/vim-easymotion  跳转                     *
"************************************************************


let g:EasyMotion_leader_key='f'


"************************************************************
"                       emmet-vim      html                 *
"************************************************************

"suger~
" let g:uesr_emmet_leader_key='<C-X>'
let g:user_emmet_leader_key='<c-y>'


"enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall

"enable in which mode
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

"************************************************************
"                    tmhedberg/SimpylFold   代码缩进        *
"************************************************************

"显示文档字符串
let g:SimpylFold_docstring_preview=1


"************************************************************
"                    indentLine    缩进指示线               *
"************************************************************

" 颜色开关，1开0关
" let g:indentLine_setColors = 0

" Vim
" let g:indentLine_color_term = 150

"指示线符号   ¦  ┆  │
" let g:indentLine_char = '|'


"************************************************************
"              Rainbow Parentheses  彩虹括号                *
"************************************************************

"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

"************************************************************
"         airblade/vim-gitgutter  显示git的 diff            *
"************************************************************

" updated when save
autocmd BufWritePost * GitGutter
let g:gitgutter_max_signs = 1000


"************************************************************
"         instant-markdown  markdown插件                    *
"************************************************************


"************************************************************
"         mileszs/ack.vim  代码查找                         *
"************************************************************

let g:ackprg = 'ag --nogroup --nocolor --column'


"************************************************************
"         dart-vim-plugin                                   *
"************************************************************

let g:ycm_dart_bin_folder_path = '/home/jianhongjianhong2/flutter/bin/cache/dart-sdk/bin'

" Enable DartFmt execution on buffer save with 1
let dart_format_on_save = 1
