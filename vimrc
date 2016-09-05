"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"********************************************************
"                   一般性配置                          *
"********************************************************
 
set laststatus =2
set cmdheight =2


"显示行号
set number
 
"设置在编辑过程中右下角显示光标的行列信息
set ruler
 
"在状态栏显示正在输入的命令
set showcmd
 
"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile
 
"设置匹配模式
set showmatch
 
"设置C/C++方式自动对齐
set autoindent
set cindent
 
"开启语法高亮功能
syntax enable
syntax on
 
"指定配色方案为256色
set t_Co=256
 
"设置搜索时忽略大小写
set ignorecase
 
"配置backspace的工作方式
set backspace=indent,eol,start
 
"设置在vim中可以使用鼠标
"set mouse=a
 
"设置tab宽度
set tabstop=4
 
"设置自动对齐空格数
set shiftwidth=4
 
"设置退格键时可以删除4个空格
set smarttab
set softtabstop=4
set shiftwidth=4 
"将tab键自动转换为空格
set expandtab
 
"设置编码方式
set encoding=utf-8
 
"自动判断编码时 依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
 
"检测文件类型
filetype on
 
"针对不同的文件采取不同的缩进方式
filetype indent on
 
"允许插件
filetype plugin on
 
"启动智能补全
filetype plugin indent on


" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White


"leader映射为
let mapleader = "b"  

set background=dark

set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

"************************************************************
"         vundle
"************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"优雅的在vim里使用git 
Plugin 'tpope/vim-fugitive'   

"优雅的跳转～
Plugin 'Lokaltog/vim-easymotion'  

"显示当前文件中的宏、全局变量、函数等
Plugin 'taglist.vim'                  

"树形的文件系统浏览器
Plugin 'The-NERD-tree'        

"彩虹括号
Plugin 'luochen1990/rainbow'    

"文件跳转兄弟俩
"Plugin 'FuzzyFinder'  
"Plugin 'L9'   

"很美观实用的状态栏 
Plugin 'Lokaltog/vim-powerline' 

"自动补全三剑客
Plugin 'Valloric/YouCompleteMe'  
Plugin 'Valloric/ListToggle'
Plugin 'Syntastic'                        "语法检查

"python
Plugin 'klen/python-mode'

"python 语法检查(error)
"Plugin 'kevinw/pyflakes-vim'

"传递路径，合理设置运行时路径。 
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


"界面UI   ??不成功
"Plugin 'altercation/vim-color-solarized'

"html
Plugin 'mattn/emmet-vim'



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


let g:ycm_path_to_python_interpreter="/usr/bin/python"
"*****************************************************
"                   taglist配置                      *
"*****************************************************
 
"不显示"press F1 to display help"
let Tlist_Compact_Format=1
 
"窗口在左侧显示
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
"let NERDTreeQuitOnOpen=1
 
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
let NERDTreeWinSize=21
 
"不显示'Bookmarks' label 'Press ? for help'
let NERDTreeMinimalUI=1
 
"快捷键
nnoremap <silent> <F4> :NERDTreeToggle<CR>

"打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree 


"如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif           


"*****************************************************
"           YouCompleteMe配置                        *
"*****************************************************
 
 
"配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
 
"按,jd 会跳转到定义
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>   
 
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0   
 
"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1 
 
 
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
let g:EasyMotion_leader_key='<Space>'

"************************************************************
"       python mode                                         *
"************************************************************





let g:pymode = 1 "关闭和打开python-mode插件


let g:pymode_python = 'python3' "or python3, disable. 选择python的版本


let g:pymode_indent = 1 "1 使用缩进的风格为pep8


let g:pymode_folding = 0 "1使能折叠功能


let g:pymode_doc = 1 " 通过命令:PymodeDoc arg查阅文档

let g:pymode_doc_bind = 'K' "光标移到参数上面按快捷键K


let g:pymode_run = 1

let g:pymode_run_bind = '<leader>r' "在vim中运行


let g:pymode_breakpoint_bind = '<leader>b' "自动加入断点语句


let g:pymode_lint_on_write = 1 "修改后检查

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']   " choose from pylint, pep8, mccabe, pep257, pyflakes

let g:pymode_rope_ropefolder='.ropeproject' "项目文件在的目录

let g:pymode_rope_show_doc_bind = '<C-c>d' "查阅帮助文档


"语法补全命令：<C-P>/<C-N>













"************************************************************
"                           slimv                           *
"************************************************************

execute pathogen#infect()
syntax enable
set number
set autoindent
filetype plugin indent on

" vim-slime  options
" Clojure options.
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" rainbow_parentheses options
autocmd Syntax clojure RainbowParenthesesLoadRound
autocmd BufEnter *.clj RainbowParenthesesToggle
autocmd BufLeave *.clj RainbowParenthesesToggle

let g:rbpt_colorpairs = [
    \ ['magenta',     'purple1'],
    \ ['cyan',        'magenta1'],
    \ ['green',       'slateblue1'],
    \ ['yellow',      'cyan1'],
    \ ['red',         'springgreen1'],
    \ ['magenta',     'green1'],
    \ ['cyan',        'greenyellow'],
    \ ['green',       'yellow1'],
    \ ['yellow',      'orange1'],
    \ ]
let g:rbpt_max =9

" vim-clojure-static options
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }


"************************************************************
"                       emmet-vim      html                 *
"************************************************************

"suger~
"let g:uesr_emmet_leader_key='C-y'

"enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"enable in which mode
let g:user_emmet_mode='n'    "only enable normal mode functions.
"let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_mode='a'    "enable all function in all mode.

"************************************************************
"                      pyflaskes      python                *
"************************************************************
"禁止
"let g:pyflakes_use_quickfix = 0


