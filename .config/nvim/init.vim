" #===========================#
"          Builtins
" #===========================#

set nocompatible
set autoindent
set backspace=2
set cc=79
set clipboard=unnamedplus
set cursorline
set encoding=utf-8
set fileformat=unix
set foldmethod=indent
set foldnestmax=1
set laststatus=2
set mouse=a
set nu relativenumber
set numberwidth=6
set ruler
set scrolloff=15
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set showcmd      " show partial commands in status line
set visualbell
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe
set wildmenu
set wildmode=list:longest,full
set title titlestring=Edit\:\ %t%(\ %M%)%(\ [%{expand(\"%:~:.:h\")}]%)%(\ %a%)

syntax on

" Save changes using sudo without involving nvim
cnoreabbrev w!! w suda://%

" Column limit
" hi OverLength ctermbg=red ctermfg=black match OverLength /\%80v.\+/

" Deletes EOL spaces
autocmd BufWritePre * :%s/\s\+$//e

" Additional filetype
au! BufRead,BufNewFile *.rules               set filetype=iptables
au! BufRead,BufNewFile *.gdb                 set filetype=gdb
au! BufRead,BufNewFile *.qrc                 set filetype=xml
au! BufRead,BufNewFile Makefile.[a-zA-Z0-9]  set filetype=make

" Expand/collapse block (toggle)
noremap <space> za
" Collapse all blocks
noremap , zr
" Expand all blocks
noremap ; zm
" Copy selection to secondary clipboard
noremap  <C-c>  "+y
" Select the word under the cursor
noremap <A-w> viw
" Go to the begin of line
noremap <C-q> <ESC>^
inoremap <C-q> <ESC>I
" Go to the end of line
noremap <C-e> <ESC>$
inoremap <C-e> <ESC>A
" Copy before the cursor
nnoremap yt y^
" Copy after the cursor
nnoremap yu y$
" Cut before the cursor
nnoremap ds d^
" Cut after the cursor
nnoremap df d$
" Move cursor to split windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


" Browse function definitions
" Open definition in tab
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open definition in vertical split
nnoremap <A-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Run clang format on the selection
noremap <C-K> :pyf /usr/share/clang/clang-format.py<cr>
inoremap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" #===========================#
"           Plugins
" #===========================#

let g:config_dir = $HOME . "/.config/nvim"
exec "source " . g:config_dir . "/plugins.vim"
