"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 字体设置
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
" https://github.com/junegunn/vim-plug

if has("win32")
    call plug#begin('$VIM/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" 颜色主题
Plug 'tomasr/molokai'                  
"Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
set termguicolors

" 状态栏
Plug 'itchyny/lightline.vim'
Plug 'ojroques/vim-scrollstatus'
let g:lightline ={
            \ 'active': {
            \ 'right': [
            \['lineinfo'],
            \['scroll'],
            \ ['coc', 'fileformat', 'filetype']]
            \ },
            \ 'component_function':{
            \'scroll': 'ScrollStatus',
            \'coc': 'vista_nearest_method_or_function',
            \ },
            \ }
let g:scrollstatus_size = 10
let g:scrollstatus_symbol_track = ' '
let g:scrollstatus_symbol_bar = '█'
set laststatus=2

" 面板
Plug 'liuchengxu/vista.vim'
let g:vista_default_executive = 'coc'
map <silent> <F3> :Vista!!<CR>
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\u0ec2",
            \  }
let g:vista_executive_for = {
			\ 'go': 'ctags',
			\ }

" 只有在neovim下有效
"Plug 'kdheepak/lazygit.nvim'
"nnoremap <silent> <F7> :LazyGit<CR>

" 开始界面
Plug 'mhinz/vim-startify'
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

" 编程语言
Plug 'fatih/vim-go' 
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 0

" CoC
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" 插入模式下粘贴内容，不会有任何变形 :set paste
Plug 'ConradIrwin/vim-bracketed-paste'    

" 快速移动，跳转到光标后任意位置
Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map ,j <Plug>(easymotion-j)
map ,k <Plug>(easymotion-k)
map ,f <Plug>(easymotion-overwin-f2)

" 自动括号补全
Plug 'Raimondi/delimitMate'               

" 方便的按分隔符对齐,比如=号
" <LEADER> + a trigger
Plug 'junegunn/vim-easy-align'        

" 缩进虚线
Plug 'Yggdroot/indentLine'                
let g:indentLine_color_term = 39
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'

" 括号
Plug 'luochen1990/rainbow'                
let g:rainbow_active = 1

" 高亮,折叠, neovim
"Plug 'nvim-treesitter/nvim-treesitter'    
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()

" 相同单词下滑线 
Plug 'dominikduda/vim_current_word'
let g:vim_current_word#highlight_current_word = 0

" 找根目录
Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files = 'current'

" TODO list 
Plug 'sakshamgupta05/vim-todo-highlight'
let g:todo_highlight_config = {
            \   'TODO': {
            \     'gui_fg_color': '#0f0fff',
            \     'gui_bg_color': '#affd3a',
            \   },
            \   'FIXME': {
            \     'gui_fg_color': '#000000',
            \     'gui_bg_color': '#af2d3a',
            \   }
            \}

" 自动对齐
" <LEADER> + f trigger
Plug 'Chiel92/vim-autoformat'

" 区域选择
Plug 'gcmt/wildfire.vim'

" 多选
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0

" Comment
Plug 'tpope/vim-commentary'

" Find & Replace
Plug 'brooth/far.vim'

Plug 'vim-scripts/vim-auto-save'
let g:auto_save_silent = 1 
autocmd FileType markdown let g:auto_save = 1

" All of your Plugs must be added before the following line
call plug#end()  

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $LANG='zh_CN.UTF-8'
set fileformat=unix "换行使用unix方式
set fileencodings=utf-8,gbk "使用utf-8或gbk打开文件
set encoding=utf-8
set langmenu=zh_CN.utf-8 "菜单语言，必须要在ssset encoding之后,界面加载之前
set ruler           "在左下角显示当前文件所在行
set showcmd         "在状态栏显示命令
set showmatch       "显示匹配的括号
set backspace=2     "在insert模式下用退格键删除
set hlsearch        "检索时高亮显示匹配项
set helplang=cn     "帮助系统设置为中文
set report=0        "显示修改次数
set mouse=a         "控制台启用鼠标
set number          "行号
set nowritebackup
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
set splitright
set splitbelow
set hidden
set cmdheight=2
set shortmess+=c

set backspace=indent,eol,start
" 显示一些不显示的空白字符
set listchars=tab:>-,eol:$,trail:-  "通过 set list和 set nolist控制是否显示或是用set list!切换显示

set foldenable
set autoread        "当文件在外部被修改，自动更新该文件

" 弹出框样式，比如自动补全的下拉框。
highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

" 自动切换目录为当前编辑文件所在目录
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一些键配置
map <silent> <leader>n :nohlsearch<cr>
inoremap jj <Esc>
noremap Q :wq<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" 多个窗口之间切换
noremap <silent><LEADER>h <C-w>h
noremap <silent><LEADER>j <C-w>j
noremap <silent><LEADER>k <C-w>k
noremap <silent><LEADER>l <C-w>l

noremap <silent><LEADER><LEADER>h <C-w>H
noremap <silent><LEADER><LEADER>j <C-w>J

" 1~9 tab 1~9
" 0 - close other tabs
noremap <silent><LEADER>1 1gt
noremap <silent><LEADER>2 2gt
noremap <silent><LEADER>3 3gt
noremap <silent><LEADER>4 4gt
noremap <silent><LEADER>5 5gt
noremap <silent><LEADER>6 6gt
noremap <silent><LEADER>7 7gt
noremap <silent><LEADER>8 8gt
noremap <silent><LEADER>9 9gt
noremap <silent><LEADER>0 :tabo<CR>
noremap <silent>tu :tabnew<CR>
noremap <silent>th :-tabnext<CR>
noremap <silent>tl :+tabnext<CR>

map s <nop>
noremap <silent>sh :set nosplitright<CR>:vnew<CR>
noremap <silent>sl :set splitright<CR>:vnew<CR>
noremap <silent>sj :set splitbelow<CR>:new<CR>
noremap <silent>sk :set nosplitbelow<CR>:new<CR>

" s - select paragraph
" a - easy motion
" x - select a word
" f - format
" c - toggle comment
xmap <LEADER>a <Plug>(EasyAlign)
map  <LEADER>s vip
map  <LEADER>x <C-N>
map  <LEADER>z :call Toggle_fold()<CR>
func! Toggle_fold()
    if &foldlevel == 0
        set foldlevel=99
        echo 'unfold'
    else
        set foldlevel=0
        echo 'fold'
    endif
endfunc

xmap <LEADER>c <plug>CommentaryLine
nmap <LEADER>c <plug>CommentaryLine
map <silent><LEADER>f :Autoformat<CR>
autocmd FileType go nmap <silent><LEADER>f :GoFmt<CR>

inoremap <A-h>  <Left>
inoremap <A-j>  <Down>
inoremap <A-k>  <Up>
inoremap <A-l>  <Right>

noremap J 20j
noremap K 20k
noremap H 0
noremap L $

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
            \ 'coc-bookmark',
            \ 'coc-cmake',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-go',
            \ 'coc-lists',
            \ 'coc-clangd',
            \ 'coc-stylelint',
            \ 'coc-todolist',
            \ 'coc-toml',
            \ 'coc-yaml',
            \ 'coc-json',
            \ 'coc-yank',
            \ 'coc-translator',
            \  ]

nmap <silent> <F2> :CocFzfList<CR>
nmap <silent> <F4> :CocCommand explorer<CR>

nmap <silent> <leader>r <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <LEADER>d :call <SID>show_documentation()<CR>

nmap <silent> d[ <Plug>(coc-diagnostic-prev)
nmap <silent> d] <Plug>(coc-diagnostic-next)

xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" m - toggle mark
map mm <Plug>(coc-bookmark-toggle)
map m] <Plug>(coc-bookmark-next)
map m[ <Plug>(coc-bookmark-prev)

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nmap <LEADER>t <Plug>(coc-translator-p)
vmap <LEADER>t <Plug>(coc-translator-pv)

noremap <silent>ff :Files<CR>
noremap <silent>fg :Rg<CR>
noremap <silent>fh :History<CR>
noremap <silent>fb :Buffers<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" go 保存时自动格式化import
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"highlight = {
"    enable = true,              -- false will disable the whole extension
"},
"}
"EOF