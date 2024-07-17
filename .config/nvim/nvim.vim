" ==================
"      Basics
" ==================
"
set nocompatible
set autoindent
set backspace=2
set cc=79
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
" Gutter space for lsp info on left
set signcolumn=yes
" Increased for lsp code actions
set updatetime=100

" ==================
"      Mappings
" ==================
"
noremap <C-Right> $
noremap <C-Left> ^
" Expand/collapse block (toggle)
noremap <space> za
" Collapse all blocks
noremap , zr
" Expand all blocks
noremap ; zm
""
" Copy/Paste mappings:
" 1. Copy selection to secondary clipboard
noremap <C-c> "+y
" 2. Remap block selection
"nnoremap v <C-v>
" 3. Paste from secondary clipboard
"noremap <C-v> "+p
" Select the word under the cursor
inoremap <C-w> <ESC>viw
noremap <C-w> <ESC>viw
" Select all of current paragraph
inoremap <C-p> <ESC>vip
noremap <C-p> <ESC>vip
" Go to the begin of line
noremap <C-l> <ESC>^
inoremap <C-l> <ESC>^
" Go to the end of line
cnoremap <A-Right> <ESC>$
vnoremap <A-Right> <ESC>$
nnoremap <A-Right> <ESC>$
""
" Browse function definitions:
" 1. Open definition in tab
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" 2. Open definition in vertical split
nnoremap <A-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Run clang format on the selection
noremap <C-K> :pyf /usr/share/clang/clang-format.py<cr>
inoremap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" ==================
"       Auto
" ==================
"
" Highlights yanked text
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
" Deletes EOL spaces
autocmd BufWritePre * :%s/\s\+$//e
" Additional filetype
au! BufRead,BufNewFile *.rules               set filetype=iptables
au! BufRead,BufNewFile *.gdb                 set filetype=gdb
au! BufRead,BufNewFile *.qrc                 set filetype=xml
au! BufRead,BufNewFile Makefile.[a-zA-Z0-9]  set filetype=make
