"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Droid\ Sans\ Mono\ 12
        " 比英文字体大一点，这样汉字的间距就不会太大了
        set guifontwide=Droid\ Sans\ 13
    elseif has("gui_kde")
        set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
    elseif has("x11")
        "set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_macvim")
        set guifont=monofur\ for\ Powerline:h15
        set guifontwide=STHeiti:h15
    elseif has("gui_win32")
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
        set guifontwide=Microsoft\ YaHei\ UI:h12
    else
        "set guifont=YaHei\ Consolas\ Hybrid:h10
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
" https://github.com/junegunn/vim-plug

if has("win32")
    call plug#begin('$VIM/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

"plugin 'asins/vimcdoc'                      "中文文档
Plug 'honza/vim-snippets'                 "快速插入代码片段snippets
Plug 'scrooloose/nerdtree'                "文件浏览，文件树目录
Plug 'scrooloose/nerdcommenter'           "快速加减注释
Plug 'scrooloose/syntastic'               "代码错误检测，其它应该也类似
Plug 'Xuyuanp/nerdtree-git-plugin'        "Git插件
Plug 'airblade/vim-gitgutter'             "Git插件
Plug 'majutsushi/tagbar'                  "标签列表
Plug 'kien/ctrlp.vim'                     "文件搜索
Plug 'vim-scripts/TaskList.vim'           "快速跳转到TODO列表
Plug 'vim-scripts/SuperTab'               "Tab代码提示
Plug 'altercation/vim-colors-solarized'   "一个对眼睛很好的vim 颜色主题
Plug 'tomasr/molokai'                     "另一种颜色主题
Plug 'fannheyward/rainbow_parentheses.vim' "括号匹配高亮
Plug 'tpope/vim-surround'                 "快速加环绕符
Plug 'tpope/vim-repeat'                   "配合使用增强版命令重复
Plug 'tpope/vim-sensible'                 "基本的Vim设置
Plug 'mhinz/vim-startify'                 "更改开始界面的插件
Plug 'fatih/vim-go'                       "GO语言
Plug 'vim-airline/vim-airline'            "状态栏
Plug 'vim-airline/vim-airline-themes'     "状态栏
Plug 'junegunn/vim-easy-align'            "方便的按分隔符对齐,比如=号
Plug 'ConradIrwin/vim-bracketed-paste'    "插入模式下粘贴内容，不会有任何变形 :set paste
"Plug 'fholgado/minibufexpl.vim'           "多文件切换，也可使用鼠标双击相应文件名进行切换
Plug 'SirVer/ultisnips'                   "宏定义补全
Plug 'Yggdroot/indentLine'                "缩进虚线
Plug 'Shougo/neocomplete.vim'             "自动补全
Plug 'Shougo/unite.vim'                   "文件或Buffer列表
Plug 'Lokaltog/vim-easymotion'            "快速移动,杀手锏，跳转到光标后任意位置
Plug 'Raimondi/delimitMate'               "自动括号补全

" All of your Plugs must be added before the following line
call plug#end()            
filetype plugin indent on   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme solarized
colorscheme molokai
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $LANG='zh_CN.UTF-8'
set fileformat=unix "换行使用unix方式
set fileencodings=utf-8,gbk "使用utf-8或gbk打开文件
set encoding=utf-8
set langmenu=zh_CN.utf-8 " 菜单语言，必须要在 set encoding之后,界面加载之前
set ruler           "在左下角显示当前文件所在行
set showcmd         "在状态栏显示命令
set showmatch       "显示匹配的括号
set backspace=2     "在insert模式下用退格键删除
set hlsearch        "检索时高亮显示匹配项
set helplang=cn     "帮助系统设置为中文
set report=0        "显示修改次数
set mouse=a         "控制台启用鼠标
set number          "行号
set nobackup        "无备份
set cursorline      "高亮显示当前行
set cursorcolumn    "高亮显示当前列
set browsedir=last  "设置borwse命令打开的目录，current当前，buffer当前buffer相同，last上次的目录
set autoindent      "继承前一行的缩进方式
set scrolloff=3     "设定光标离窗口上下边界3行时窗口自动滚动
set smartindent     "自动缩进
set expandtab       "用空格代替tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start
" 显示一些不显示的空白字符
set listchars=tab:>-,eol:$,trail:-  "通过 set list和 set nolist控制是否显示或是用set list!切换显示

"set foldmethod=indent     "indent 折叠方式
"set foldmethod=marker     "marker 折叠方式
set autoread               "当文件在外部被修改，自动更新该文件

" 弹出框样式，比如自动补全的下拉框。
highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一些键配置
map <silent> <leader>ee :e ~/.vimrc<cr>
map <silent> <leader>n :nohlsearch<cr>
inoremap <C-g> <Esc>
inoremap jj <Esc>
" \s 一键保存
func! SaveFile()
    exec "w"
endfunc
map  <leader>s :call SaveFile()<CR>
imap <leader>s <ESC>:call SaveFile()<CR>
vmap <leader>s <ESC>:call SaveFile()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif
" }}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动切换目录为当前编辑文件所在目录
au BufRead,BufNewFile,BufEnter * cd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command W w
:command Q q
:command Qa qa
:command Wa wa
:command Wqa wqa
:command WQa wqa

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Recommended key-mappings. For no inserting <CR> key.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-n>\<C-y>" : "\<CR>"
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用powerline的箭头，需要安装powerline字体，在未安装powerline字体的情况下，
" 可以将此值设置为0，这将使用之后的这些默认的符号替换。
let g:airline_powerline_fonts = 0
if g:airline_powerline_fonts == 0
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '§'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.readonly = ''
endif

set laststatus=2

" airline-tabline扩展设计
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':p:t' " 只显示文件名，不显示路径内容。

if g:airline_powerline_fonts == 0
    let g:airline#extensions#tabline#left_sep = '▶'
    let g:airline#extensions#tabline#left_alt_sep = '❯'
    let g:airline#extensions#tabline#right_sep = '◀'
    let g:airline#extensions#tabline#right_alt_sep = '❮'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](bower_components|node_modules|vendor|target|dist|_site|nginx_runtime|build|logs|data)|(\.(swp|ico|git|svn))$'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set wildignore+=*.pyc,*.sqlite,*.sqlite3,cscope.out
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/nginx_runtime/*,*/build/*,*/logs/*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSF
:com! -n=* F CtrlSF <args>
:com! -n=0 FOpen CtrlSFOpen
"let g:ctrlsf_auto_close = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tasklist
let g:tlTokenList = ['TODO' , 'WTF', 'FIX']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadSquare " []
au Syntax * RainbowParenthesesLoadBraces " {}
au Syntax * RainbowParenthesesLoadChevrons " <>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
let g:startify_custom_header = [
\'   １１１ＭＭＭ１１１１ＭＭＭ１１１１ＭＭＭ１１１１１ＭＭＭ１１１１１１１１１１１１１１１１１１１１１１１１１１１１１１１１',
\'   １１１ＭＭＭＭ１１ＭＭＭＭ１１１１ＭＭＭＭ１１１１ＭＭＭ１１１１１１ＭＭＭＭＭＭＭＭ１１１１１ＭＭＭＭ１１１１ＭＭＭＭ１',
\'   １１１ＭＭＭＭ１ＭＭＭＭ１１１１１１ＭＭＭ１１１ＭＭＭＭ１１１１１１ＭＭＭＭＭＭＭＭ１１１１１ＭＭＭＭ１１１１ＭＭＭＭ１',
\'   １１１１ＭＭＭＭＭＭＭ１１１１１１１ＭＭＭＭ１１ＭＭＭ１１１１１１１１１ＭＭＭ１１１１１１１１ＭＭＭＭＭ１１ＭＭＭＭＭ１',
\'   １１１１１ＭＭＭＭＭＭ１１１１１１１ＭＭＭＭ１１ＭＭＭ１１１１１１１１１ＭＭＭ１１１１１１１１ＭＭＭＭＭ１１ＭＭＭＭＭ１',
\'   １１１１１ＭＭＭＭＭ１１１１１１１１１ＭＭＭ１ＭＭＭ１１１１１１１１１１ＭＭＭ１１１１１１１１ＭＭＭＭＭＭ１ＭＭＭＭＭ１',
\'   １１１１１ＭＭＭＭＭ１１１１１１１１１ＭＭＭ１ＭＭＭ１１１１１１１１１１ＭＭＭ１１１１１１１１ＭＭ１ＭＭＭＭＭＭＭＭＭ１',
\'   １１１１１ＭＭＭＭＭＭ１１１１１１１１１ＭＭＭＭＭＭ１１１１１１１１１１ＭＭＭ１１１１１１１１ＭＭ１ＭＭＭＭＭＭＭＭＭ１',
\'   １１１１ＭＭＭＭＭＭＭＭ１１１１１１１１ＭＭＭＭＭ１１１１１１１１１１１ＭＭＭ１１１１１１１１ＭＭ１１ＭＭＭＭ１ＭＭＭ１',
\'   １１１ＭＭＭＭ１ＭＭＭＭ１１１１１１１１ＭＭＭＭＭ１１１１１１１１１ＭＭＭＭＭＭＭＭ１１１１１ＭＭ１１ＭＭＭＭ１ＭＭＭ１',
\'   １１１ＭＭＭ１１１ＭＭＭＭ１１１１１１１１ＭＭＭＭ１１１１１１１１１ＭＭＭＭＭＭＭＭ１１１１１ＭＭ１１ＭＭＭＭ１ＭＭＭ１']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
nmap <F3> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\.out$', 'bak$', 'node_modules', 'dist']
let NERDTreeShowHidden=0             "不显示隐藏文件(好像只在linux环境中有效)
let NEDTreeCaseSensitiveSort=0       "不分大小写排序c$','/.h$', '*']    // 排序
let NERDTreeHighlightCursorline=1    "高亮NERDTrre窗口的当前行

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
" <leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中
" leader>cu，取消选中文本块的注释。
let NERDSpaceDelims = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" miniBufExpl
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1 "解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable  = 1
let g:miniBufExplorerMoreThanOne    = 2
let g:miniBufExplCycleArround       = 1
"buffer 切换快捷键，默认方向键左右可以切换buffer
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 多个窗口之间切换
map <C-j> <C-W>j
map <C-k> <C-W>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=go#complete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
" 向上级目录递归查找tags文件（好像只有在Windows下才有用）
set tags=./tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
let g:indentLine_color_term = 39
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"语法错误
let g:syntastic_error_symbol = ">>"
let g:syntastic_warning_symbol = ">"
"语法风格错误
let g:syntastic_style_error_symbol="✗"
let g:syntastic_style_warning_symbol="⚠"
"开启各类语言的语法检测
let g:syntastic_go_checkers = 1
