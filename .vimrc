".vimrc: configuration of vim
"Author: Liang Jiang
"Date: 2014-10-10

let mapleader = ","

"显示行号
set number
"检测文件类型
filetype on
filetype indent on
filetype plugin on
"记录历史的行数
set history=1000
"背景颜色为黑色
set background=dark
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1, "\#!/usr/bin/env bash") 
        call append(line("."), "\###############################################")
        call append(line(".")+1, "\# File Name: ".expand("%")) 
        call append(line(".")+2, "\# Author: Liang Jiang") 
        call append(line(".")+3, "\# mail: jiangliang0811@gmail.com") 
        call append(line(".")+4, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+5, "\# Description: ")
        call append(line(".")+6, "\###############################################")
        call append(line(".")+7, "") 
        call append(line(".")+8, "set -e")
        call append(line(".")+9, "set -x")
        call append(line(".")+10, "")
        normal G
     
    elseif &filetype == "python" 
        call setline(1, "\#!/usr/bin/env python") 
        call append(line("."), "\#coding=utf-8") 
        call append(line(".")+1, "\###############################################")
        call append(line(".")+2, "\# File Name: ".expand("%")) 
        call append(line(".")+3, "\# Author: Liang Jiang") 
        call append(line(".")+4, "\# mail: jiangliang0811@gmail.com") 
        call append(line(".")+5, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+6, "\# Description: ")
        call append(line(".")+7, "\###############################################")
        call append(line(".")+8, "") 
        call append(line(".")+9, "import argparse") 
        call append(line(".")+10, "")
        call append(line(".")+11, "def argparser():")
        call append(line(".")+12, "    parser = argparse.ArgumentParser()")
        call append(line(".")+13, "    return parser")
        call append(line(".")+14, "")
        call append(line(".")+15, "def main():")
        call append(line(".")+16, "    parser = argparser()")
        call append(line(".")+17, "    args = parser.parse_args()")
        call append(line(".")+18, "")
        call append(line(".")+19, "if \"__main__\" == __name__:")
        call append(line(".")+20, "    main()")
        normal 17G
        

    elseif &filetype == 'cpp' || &filetype == 'c'
        call setline(1, "/*")
        call append(line("."), "* File Name: ".expand("%")) 
        call append(line(".")+1, "* Author: Liang Jiang") 
        call append(line(".")+2, "* Mail: jiangliang0811@gmail.com") 
        call append(line(".")+3, "* Created Time: ".strftime("%c")) 
        call append(line(".")+4, "* Description: ")
        call append(line(".")+5,"*/")
        call append(line(".")+6, "")

        if &filetype == 'cpp'
            call append(line(".")+7, "#include <iostream>")
            call append(line(".")+8, "")
            call append(line(".")+9, "using namespace std;")
            call append(line(".")+10, "")
            call append(line(".")+11, "int main(int argc, char* argv[]) {") 
            call append(line(".")+12, "  ") 
            call append(line(".")+13, "  return 0;") 
            call append(line(".")+14,"}")
            normal 12G 
        endif
        if &filetype == 'c'
            call append(line(".")+7, "#include <stdio.h>")
            call append(line(".")+8, "")
            call append(line(".")+9, "int main(int argc, char* argv[]) {") 
            call append(line(".")+10, "  ") 
            call append(line(".")+11, "  return 0;") 
            call append(line(".")+12,"}")
            normal 10G 
        endif
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set clipboard=unnamed	" yank to the system register (*) by default
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" fun! Replace() 
"     let s:word = input("Replace " . expand('<cword>') . " with:") 
"     :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
"     :unlet! s:word 
" endfun 

" map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

"禁止光标闪烁"
set gcr=a:block-blinkon0
"语法高亮
syntax on
"高亮当前行号"
""set cursorline
""set cursorcolumn
"缩进与智能缩进
set autoindent
set cindent
set smartindent
"tab键为4个空格，行之间交错时使用4个空格
set expandtab 
set tabstop=2
set shiftwidth=2
set softtabstop=2
"设置匹配模式，括号匹配等
set showmatch
"去除Vim的GUI版本的toolbar
set guioptions=T
"去掉警告响声

"查询相关设置
set vb t_vb= 
"查询时，匹配当前已输入单词的第一个单词
set incsearch
"高亮查询结果
set hlsearch
set nobackup

"禁止光标闪烁"
set novisualbell
"状态栏相关设置
"设置右下角显示光标位置的状态行
set ruler
"设置状态栏显示格式
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c]
"设置总是显示状态栏
set laststatus=2

"代码折叠
set foldmethod=indent
set nofoldenable
set foldlevel=100

"设置快捷键
nmap vo <C-o>
nmap vi <C-i>
nmap  J <C-w>j
nmap  H <C-w>h
nmap  K <C-w>k
nmap  L <C-w>l
map  df <Esc>
omap df <Esc>
imap df <Esc>
cmap df <Esc> 
imap mf <cr>
nmap <Leader>z :ZoomWin<cr>
map <leader>n :NERDTree<cr>
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" set <leader><leader>r to compile and run 
autocmd FileType python map <leader>r :call RunPython()<cr>
autocmd FileType sh map <leader>r :call RunSH()<cr>
autocmd FileType c map <leader>r :call CompileRunGcc()<cr>
autocmd FileType c map <leader>d :call DebugGcc()<cr>
autocmd FileType cpp map <leader>r :call CompileRunGpp()<cr>
autocmd FileType cpp map <leader>d :call DebugGpp()<cr>

func! RunPython()
  exec "w"
  exec "!cat ./.args/.%.args 2>/dev/null | xargs python %"
endfunc

"function to compile and runn C file
func! CompileRunGcc()
  exec "w"
  exec "!gcc % -o %<"
  exec "!cat ./.args/.%.args 2>/dev/null | xargs ./%<"
endfunc
func!  DebugGcc()
exec "w"
exec "!gcc % -o %< -g"
exec "!cgdb %<"
endfunc


"function to compile and runn C++ file
func! CompileRunGpp()
  exec "w"
  exec "!g++ % -o %<"
  exec "!cat ./.args/.%.args 2>/dev/null | xargs ./%<"
endfunc
func!  DebugGpp()
exec "w"
exec "!g++ % -o %< -g"
exec "!cgdb %<"
endfunc

func! RunSH()
  exec "w"
  exec "!chmod a+x %"
  exec "!cat ./.args/.%.args 2>/dev/null | xargs ./%"
endfunc

"property of cscope
set csprg=/usr/local/bin/cscope
"property of supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabRetainCompletionType = 2

" set *(#) in visual mode to forward/backward search selected content
vnoremap * y/<C-r>0<CR>
vnoremap # y?<C-r>0<CR>

"properties of matlab"
source $VIMRUNTIME/macros/matchit.vim
nmap <Leader>w :wa!<cr>
nmap <Leader>q :q<cr>
nmap <Leader><leader>q :qa<cr>
nmap <Leader>x :xa<cr>


"set <leader>p to toggle paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" "" 从第二层开始可视化显示缩进
" let g:indent_guides_start_level=1
" " 色块宽度
" let g:indent_guides_guide_size=1
" :nmap <silent> <Leader>d <Plug>IndentGuidesToggle
" " 设置插件 indexer 调用 ctags 的参数
" " " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" " " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl

nnoremap <silent><Leader>g :Grep<CR>
"auto-completion"
set completeopt=longest,menu
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Plugins
Plugin 'airblade/vim-gitgutter'
nnoremap <leader><leader>n :GitGutterNextHunk<CR>
nnoremap <leader><leader>p :GitGutterPrevHunk<CR>
let g:gitgutter_max_signs = 10000
Plugin 'DfrankUtil'
Plugin 'gmarik/vundle'
Plugin 'gregsexton/gitv'
Plugin 'kshenoy/vim-signature'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
Plugin 'majutsushi/tagbar'
"tagbar"
let tagbar_left=0 
nnoremap <Leader>t :TagbarToggle<CR> 
let g:tagbar_autofocus=1
let tagbar_width=40 
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'syntastic'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/'] 
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_wq = 0
noremap <leader>e :call ToggleErrors()<cr> 
noremap <leader>en :lnext<cr>
noremap <leader>ep :lprevious<cr>
function! ToggleErrors()
  let old_last_winnr = winnr('$')
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel"
    Errors
  endif
endfunction

Plugin 'tpope/vim-commentary'
autocmd FileType python,shell set commentstring=#\ %s

Plugin 'tpope/vim-fugitive'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'vim' : 1,
      \}
let g:ycm_error_symbol='>>'  
let g:ycm_warning_symbol='>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  
"开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files = 1  
"开启语义补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"在接受补全后不分裂出一个窗口显示接受的项  
set completeopt-=preview  
"不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0  
"注释和字符串的的补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"每次重新生成匹配项，禁止缓存匹配项  
"let g:ycm_cache_omnifunc=0  
"在注释中也可以补全  
let g:ycm_complete_in_comments=1  
"在字符串中也可以补全
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion='<C-d>'
"输入第一个字符就开始补全  
" let g:ycm_min_num_of_chars_for_completion=1  
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可  
let g:ycm_use_ultisnips_completer=0
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" let g:ycm_min_num_of_chars_for_completion=5
"let g:ycm_auto_trigger = 0
"设置跳转的快捷键，可以跳转到definition和declaration  
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>  
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>  
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>  
Plugin 'vimprj'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'Yggdroot/indentLine'
Plugin 'ZoomWin'
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>a'
let g:ctrlp_cmd = 'CtrlP'

Plugin 'dyng/ctrlsf.vim'
vnoremap <leader>cf y:CtrlSF <C-r>0<CR>
nnoremap <leader>cf yiw:CtrlSF <C-r>0<CR>

  


