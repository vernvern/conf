set shell=/bin/sh

set mouse="" " 禁止鼠标

" https://github.com/junegunn/vim-plug
" PlugInstall PlugClean PlugStatus PlugUpdate PlugUpgrade
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" git 状态栏 Plug 'airblade/vim-gitgutter'

"彩虹括号
"Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 注释
Plug 'preservim/nerdcommenter'

" markdown 实时查看
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" 多个高亮搜索项
Plug 'lfv89/vim-interestingwords'

" 显示标记
Plug 'kshenoy/vim-signature'

" 竖线
Plug 'Yggdroot/indentLine'

" 格式化代码工具
Plug 'chiel92/vim-autoformat'

call plug#end()

" 指定默认python3路径
" let g:python3_host_prog="/usr/local/opt/python@3.8/bin/python3"

let mapleader=","

"去掉vi的一致性
set nocompatible

"设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile

"显示匹配括号
set showmatch

"文件编码
set fenc=utf-8

"突出显示当前列
" set cursorcolumn

" 竖线
" set list lcs=tab:\¦\ 

"突出显示当前行
set cursorline

" stop beep
set visualbell

set background=dark

"设置编码方式
set encoding=utf-8

"指定配色方案为256色
set t_Co=256

"高亮搜索项
set hlsearch

"自动判断编码时 依次尝试以下编码
set fileencodings=utf-8,gb18030,big5,latin1

" paste 模式开关
set pastetoggle=<F3>

" 左边border颜色
hi FoldColumn ctermbg=Black ctermfg=Black

" "开启语法高亮功能
syntax enable
syntax on

"设置tab宽度
set tabstop=4
au BufNewFile,BufRead *.dart set tabstop=2
au BufNewFile,BufRead *.yml set tabstop=2
au BufNewFile,BufRead *.yaml set tabstop=2
au BufNewFile,BufRead *.js set tabstop=4
au BufNewFile,BufRead *.html set tabstop=4

"设置自动对齐空格数
set shiftwidth=4
au BufNewFile,BufRead *.dart set shiftwidth=2
au BufNewFile,BufRead *.yml set shiftwidth=2
au BufNewFile,BufRead *.yaml set shiftwidth=2
au BufNewFile,BufRead *.js set shiftwidth=4
au BufNewFile,BufRead *.html set shiftwidth=4
set softtabstop=4
au BufNewFile,BufRead *.dart set softtabstop=2
au BufNewFile,BufRead *.yml set softtabstop=2
au BufNewFile,BufRead *.yaml set softtabstop=2
au BufNewFile,BufRead *.js set softtabstop=4
au BufNewFile,BufRead *.html set softtabstop=4

"设置退格键时可以删除4个空格
set smarttab

"将tab键自动转换为空格
set expandtab

"检测文件类型
filetype on

"针对不同的文件采取不同的缩进方式
filetype indent on

filetype plugin on


" 标出多余空格
" autocmd BufNewFile,BufRead *.py exec ":call Highlight_py_space()"
autocmd BufNewFile,BufRead * exec ":call Highlight_py_space()"
func Highlight_py_space()
highlight RedundantSpaces ctermbg=red guibg=red
" 结尾空格 & 制表符tab
" match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
" 结尾空格
match RedundantSpaces /\s\+$/
endfunc

" Enable folding  代码折叠
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar   error
" nnoremap <space> za

" tab 选择补全
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()


"************************************************************
"             vim-gitgutter                                 *
"************************************************************

highlight SignColumn guibg=black ctermbg=black

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1



"************************************************************
"         rainbow  彩虹括号                                 *
"************************************************************


let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle



"************************************************************
"          'Yggdroot/LeaderF'                               *
"************************************************************

let g:Lf_ShortcutF = '<C-P>'
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

" popup mode
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }


" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e ")<CR>
" search visually selected text literally
" xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
" noremap go :<C-U>Leaderf! rg --recall<CR>

let g:Lf_ShowDevIcons = 1

"************************************************************
"              coc-nvim                                     *
"************************************************************
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



"************************************************************
"              lfv89/vim-interestingwords                   *
"************************************************************

nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
vnoremap <silent> <leader>k :call InterestingWords('v')<cr>
nnoremap <silent> <leader>k :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>


"************************************************************
"                  'Yggdroot/indentLine'                    *
"************************************************************

let g:indentLine_char_list = ['|', '¦', '┆', '┊']



"************************************************************
"                chiel92/vim-autoformat'                    *
"************************************************************

let g:formatdef_my_clang = '"clang-format"'
let g:formatters_cpp = ['my_clang']
let g:formatters_c = ['my_clang']
noremap <F9> :Autoformat<cr>
" autocmd BufWritePre *.cpp,*.h  Autoformat  "  保存时触发
