"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Droid\ Sans\ Mono\ 12
        " 比英文字体大一点，这样汉字的间距就不会太大了
        set guifontwide=Droid\ Sans\ 13
    elseif has("gui_kde")
        "set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
    elseif has("x11")
        "set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_macvim")
        set guifont=monofur\ for\ Powerline:h15
        set guifontwide=STHeiti:h15
    elseif has("gui_kde")
        " todo
    elseif has("gui_win32")
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
        set guifontwide=Microsoft\ YaHei\ UI:h12
    else
        "set guifont=YaHei\ Consolas\ Hybrid:h10
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
" https://github.com/gmarik/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim
    call vundle#rc('$VIM/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'asins/vimcdoc'
Plugin 'honza/vim-snippets'                 "快速插入代码片段snippets
Plugin 'scrooloose/nerdtree'                "文件浏览，文件树目录
Plugin 'scrooloose/nerdcommenter'           "快速加减注释
Plugin 'scrooloose/syntastic'               "代码错误检测，其它应该也类似
Plugin 'majutsushi/tagbar'                  "标签列表
Plugin 'kien/ctrlp.vim'                     "文件搜索,杀手级, 重新定义了编辑器打开文件的方式
Plugin 'vim-scripts/TaskList.vim'           "快速跳转到TODO列表
Plugin 'vim-scripts/SuperTab'               "Tab代码提示
Plugin 'altercation/vim-colors-solarized'   "一个对眼睛很好的vim 颜色主题
Plugin 'tomasr/molokai'                     "另一种颜色主题
Plugin 'fannheyward/rainbow_parentheses.vim' "括号匹配高亮
Plugin 'tpope/vim-surround'                 "快速加环绕符
Plugin 'tpope/vim-repeat'                   "配合使用增强版命令重复
Plugin 'tpope/vim-sensible'                 "基本的Vim设置
Plugin 'mhinz/vim-startify'                 "更改开始界面的插件
Plugin 'fatih/vim-go'                       "GO语言
Plugin 'bling/vim-airline'                  "状态栏
Plugin 'junegunn/vim-easy-align'            "方便的按分隔符对齐,比如=号
Plugin 'ConradIrwin/vim-bracketed-paste'    "插入模式下粘贴内容，不会有任何变形 :set paste
Plugin 'fholgado/minibufexpl.vim'           "多文件切换，也可使用鼠标双击相应文件名进行切换
Plugin 'SirVer/ultisnips'                   "宏定义补全
Plugin 'Yggdroot/indentLine'                "缩进虚线
Plugin 'Shougo/neocomplcache.vim'           "自动补全，比较小
Plugin 'Lokaltog/vim-easymotion'            "快速移动,杀手锏，跳转到光标后任意位置
Plugin 'Raimondi/delimitMate'               "自动括号补全


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set background=dark
" colorscheme solarized
colors molokai
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $LANG='zh_CN.UTF-8'
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
set fileformat=unix "换行使用unix方式
set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
set cursorline      " 高亮显示当前行
set cursorcolumn    " 高亮显示当前列
set nu              " 显示行号
set browsedir=last  " 设置borwse命令打开的目录，current当前，buffer当前buffer相同，last上次的目录
set autoindent      " 继承前一行的缩进方式
set scrolloff=3     " 设定光标离窗口上下边界3行时窗口自动滚动
set smartindent     " 自动缩进
set expandtab       " 用空格代替tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start
" 显示一些不显示的空白字符
set listchars=tab:>-,eol:$,trail:-  " 通过 set list和 set nolist控制是否显示或是用set list!切换显示

"set foldmethod=indent     " indent 折叠方式
"set foldmethod=marker     " marker 折叠方式
set autoread               " 当文件在外部被修改，自动更新该文件

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

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : '标准',
      \ 'i'  : '插入',
      \ 'R'  : '替换',
      \ 'c'  : '命令行',
      \ 'v'  : '可视',
      \ 'V'  : '可视',
      \ ''   : '可视',
      \ 's'  : '选择',
      \ 'S'  : '选择',
      \ ''   : '选择',
      \ }

set laststatus=2

" airline-tabline扩展设计，若需要更专业的buffer列表显示插件，
" 可以使用 techlivezheng/vim-plugin-minibufexpl 插件！
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamemod = ':p:t' " 只显示文件名，不显示路径内容。

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
    \'                        740442277',
    \'                     788888888888847',
    \'                   788888888477288888                   772088888047',
    \'                  7888880857     58888     7         79888888888008882',
    \'                  8827277        788882 5888888857  78888888800900450887',
    \'                 784              588888845908888882880885775809554444587',
    \'                 782              78842 7   7777777884402    7708455444587',
    \'                  82 77     77777  057             284547      74804980049',
    \'                  722544772772272478277            78547         5888880087',
    \'                   877777872    7  027 7         7 780427777      708889908',
    \'                   777  77  77     487   77    77   089777727     77  184987',
    \'                   77   77  7      157   77    77   0807 777           04487',
    \'                    7   777   7    277             78887         77    20582',
    \'                    77  7777777   75 77            78007     777777777 70585',
    \'                      7         770   77    777     88047777777   77   28087',
    \'                      4777    77298   7477      71772888077 777   7   78885',
    \'                   28887772251122584777722277772772777772777        728807',
    \'               7588888807      771777777777777777727777    7477    7247777  777',
    \'         77 772827    200427   7777777777777777777722585   5425227777   757 77 777',
    \'       7   72277   777744490427777777777777777   74007705 727  7   7     777  74 72',
    \'     7881777777777777777721248877777777777727777  752     7977  777         7 7 77777',
    \'    78548821545000244449080088277777777777777217        77727777   7               777',
    \'    8952208858044544809552245527777777777727127 77      7777  7 7 7                  7',
    \'',
    \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\.out$', 'bak$', 'node_modules', 'dist']
let NERDTreeShowHidden=0             " 不显示隐藏文件(好像只在linux环境中有效)
let NEDTreeCaseSensitiveSort=0       " 不分大小写排序c$','/.h$', '*']    // 排序
let NERDTreeHighlightCursorline=1    " 高亮NERDTrre窗口的当前行

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
" <leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中
" leader>cu，取消选中文本块的注释。
let NERDSpaceDelims = 1

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
" buffer 切换快捷键，默认方向键左右可以切换buffer
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 多个窗口之间切换
map <C-j> <C-W>j
map <C-k> <C-W>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=gocomplete#Complete
autocmd Filetype c setlocal omnifunc=ccomplete#Complete

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c     = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.go    = '\h\w*\.'
let g:neocomplcache_omni_patterns.cpp   = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

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
" 语法错误
let g:syntastic_error_symbol = ">>"
let g:syntastic_warning_symbol = ">"
" 语法风格错误
let g:syntastic_style_error_symbol="✗"
let g:syntastic_style_warning_symbol="⚠"
" 开启各类语言的语法检测
let g:syntastic_go_checkers = 1
