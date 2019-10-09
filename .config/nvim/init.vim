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

" Collapse or expand
map <space> za
map , zr
map ; zm

" Clipboard copy:
vnoremap  <leader>y  "+y

map <C-q> <ESC>^
imap <C-q> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A

" Copy Paste Craziness
nnoremap yu y$
nnoremap yt y^
nnoremap df d$
nnoremap ds d^

" Browse function definitions
" Open definition in tab
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open definition in vertical split
nnoremap <A-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" #===========================#
"           Plugins
" #===========================#

let g:config_dir = $HOME . "/.config/nvim"
exec "source " . g:config_dir . "/plugins.vim"
